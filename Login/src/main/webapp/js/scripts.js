// *********************************************************
  // First, set up the infrastructure to do HTML drag-and-drop
  // *********************************************************

  const d = document, w = window, c = console;

  function init() {
    let dragged = null; // A reference to the element currently being dragged

    // This event should only fire on the drag targets.
    // Instead of finding every drag target,
    // we can add the event to the document and disregard
    // all elements that are not of class "draggable"
    // Para agarrar cualquier elemento con la clase draggable
    document.addEventListener(
      'dragstart',
      (event) => {
        if (event.target.className !== 'draggable') return;
        // Some data must be set to allow drag
        event.dataTransfer.setData('text', event.target.textContent);

        // store a reference to the dragged element and the offset of the mouse from the center of the element
        dragged = event.target;
        dragged.offsetX = event.offsetX - dragged.clientWidth / 2;
        dragged.offsetY = event.offsetY - dragged.clientHeight / 2;
        // Objects during drag will have a red border
        event.target.style.border = '2px solid darkblue'; // Esto es para que en la paleta, al agarrar un elemento le cambie el border
      },
      false
    );

    // This event resets styles after a drag has completed (successfully or not)
    document.addEventListener(
      'dragend',
      (event) => {
        // reset the border of the dragged element. 
        // El borde de antes se reseta a como estaba antes
        dragged.style.border = '';
        onHighlight(null);
      },
      false
    );

    
    // Next, events intended for the drop target - the Diagram div

    const div = document.getElementById('myDiagramDiv');
    // Este dragenter es para cuando myDiagramDiv detecta que hay un elemento que le está pasando x encima 
    div.addEventListener(
      'dragenter',
      (event) => {
        // Here you could also set effects on the Diagram,
        // such as changing the background color to indicate an acceptable drop zone
        // alert("Hola");
        // Requirement in some browsers, such as Internet Explorer
        event.preventDefault();
      },
      false
    );

    // En resumen, este fragmento de código controla el comportamiento del evento dragover sobre el área del diagrama GoJS. Permite resaltar la parte del diagrama sobre la cual se está arrastrando un elemento y gestiona las condiciones para permitir o denegar el drop basado en la posición del cursor y la clase del elemento receptor (dropzone).

    // La diferencia es que el dragenter se ejecuta cuando entra en una zona específica y ya. El dragover se dispara repetidamente mientras el elemento arrastrado se mueve dentro del area de destino 

    div.addEventListener(
      'dragover',
      (event) => {
        // We call preventDefault to allow a drop
        // But on divs that already contain an element,
        // we want to disallow dropping
        if (div === myDiagram.div) {
          const can = event.target;
          const pixelratio = myDiagram.computePixelRatio();

          // if the target is not the canvas, we may have trouble, so just quit:
          if (!(can instanceof HTMLCanvasElement)) return;

          const bbox = can.getBoundingClientRect();
          let bbw = bbox.width;
          if (bbw === 0) bbw = 0.001;
          let bbh = bbox.height;
          if (bbh === 0) bbh = 0.001;
          // mx y my permite determinar la posición exacta donde se está arrastrando sobre el diagrama.
          const mx = event.clientX - bbox.left * (can.width / pixelratio / bbw);
          const my = event.clientY - bbox.top * (can.height / pixelratio / bbh);
          const point = myDiagram.transformViewToDoc(new go.Point(mx, my));
          const part = myDiagram.findPartAt(point, true);
          onHighlight(part);
        }

        if (event.target.className === 'dropzone') {
          // Disallow a drop by returning before a call to preventDefault:
          // Si el elemento sobre el cual se está arrastrando tiene la clase dropzone, significa que no queremos permitir que se realice una acción de drop en ese elemento específico. Por lo tanto, se retorna temprano antes de llamar a preventDefault().
          return;
        }

        // Allow a drop on everything else
        event.preventDefault();
      },
      false
    );

    div.addEventListener(
      'dragleave',
      (event) => {
        // reset background of potential drop target
        if (event.target.className == 'dropzone') {
          event.target.style.background = '';
        }
        onHighlight(null);
      },
      false
    );

    // Se ejecuta al soltar un elemento en el myDiagram
    div.addEventListener(
      'drop',
      (event) => {
        // prevent default action
        // (open as link for some elements in some browsers)
        event.preventDefault();
        // alert("drop");
        // Dragging onto a Diagram
        if (div === myDiagram.div) {
          const can = event.target;
          const pixelratio = myDiagram.computePixelRatio();

          // if the target is not the canvas, we may have trouble, so just quit:
          if (!(can instanceof HTMLCanvasElement)) return;

          const bbox = can.getBoundingClientRect();
          let bbw = bbox.width;
          if (bbw === 0) bbw = 0.001;
          let bbh = bbox.height;
          if (bbh === 0) bbh = 0.001;
          const mx = event.clientX - bbox.left * (can.width / pixelratio / bbw);
          const my = event.clientY - bbox.top * (can.height / pixelratio / bbh);
          const point = myDiagram.transformViewToDoc(new go.Point(mx, my));
          // // if there's nothing at that point
          // if (myDiagram.findPartAt(point) === null) {
          //   // a return here doesn't allow the drop to happen
          //   return;
          // }
          // otherwise create a new node at the drop point
          // SE CREA UN NUEVO NODO
          myDiagram.startTransaction('new node');
          const newdata = {
            // assuming the locationSpot is Spot.Center:
            location: myDiagram.transformViewToDoc(
              new go.Point(mx - dragged.offsetX, my - dragged.offsetY)
            ),
            text: event.dataTransfer.getData('text'),
            color: 'green',
          };
          myDiagram.model.addNodeData(newdata);
          const newnode = myDiagram.findNodeForData(newdata);
          if (newnode) {
            newnode.ensureBounds();
            myDiagram.select(newnode);
            onDrop(newnode, point);
          }
          myDiagram.commitTransaction('new node');

        }

        // If we were using drag data, we could get it here, ie:
        // const data = event.dataTransfer.getData('text');
      },
      false
    );

    // this is called on a stationary node or link during an external drag-and-drop into a Diagram
    function onHighlight(part) {
      // may be null
      const oldskips = myDiagram.skipsUndoManager;
      myDiagram.skipsUndoManager = true;
      myDiagram.startTransaction('highlight');
      if (part !== null) {
        myDiagram.highlight(part);
      } else {
        myDiagram.clearHighlighteds();
      }
      myDiagram.commitTransaction('highlight');
      myDiagram.skipsUndoManager = oldskips;
    }

    // this is called upon an external drop in this diagram,
    // after a new node has been created and selected
    function onDrop(newNode, point) {
      // look for a drop directly onto a Node or Link
      const it = myDiagram.findPartsAt(point).iterator;
      while (it.next()) {
        const part = it.value;
        if (part === newNode) continue;
        // the drop happened on some Part -- call its mouseDrop handler
        if (part && part.mouseDrop) {
          const e = new go.InputEvent();
          e.diagram = myDiagram;
          e.documentPoint = point;
          e.viewPoint = myDiagram.transformDocToView(point);
          e.up = true;
          myDiagram.lastInput = e;
          // should be running in a transaction already
          part.mouseDrop(e, part);
          return;
        }
      }
      // didn't find anything to drop onto
    }

    // *****************************
    // Second, set up a GoJS Diagram
    // *****************************

    // Since 2.2 you can also author concise templates with method chaining instead of GraphObject.make
    // For details, see https://gojs.net/latest/intro/buildingObjects.html
    const $ = go.GraphObject.make; // for conciseness in defining templates

    const myDiagram = new go.Diagram(
      'myDiagramDiv', // create a Diagram for the DIV HTML element
      {
        layout: $(go.TreeLayout),
        'undoManager.isEnabled': true,
      }
    );

    // define a Node template | Cambiar estilo o características del nodo
    myDiagram.nodeTemplate = 
    $(go.Node,'Auto',
      { locationSpot: go.Spot.Center },
      new go.Binding('location'),
      $(go.Shape,
        { fill: 'white' },
        'RoundedRectangle',
        // Shape.fill is bound to Node.data.color
        new go.Binding('fill', 'color'),
        // this binding changes the Shape.fill when Node.isHighlighted changes value
        new go.Binding('fill', 'isHighlighted', (h, shape) => {
          if (h) return 'darkred'; //EDITAR COLOR HOVER
          const c = shape.part.data.color;
          return c ? c : 'white';
        }).ofObject()
      ), // binding source is Node.isHighlighted
      $(go.TextBlock,
        { margin: 10, font: 'bold 16px sans-serif', width: 140, textAlign: 'center', 
          
        },
        // TextBlock.text is bound to Node.data.text
        new go.Binding('text')
      ),
      {
        doubleClick: function(e,node){
          const $body = d.getElementById("body");
          const $decitionformContainer = document.createElement('div');
          $decitionformContainer.setAttribute("class","decitionformContainer")
          $decitionformContainer.innerHTML = `
            <form>
            <h3>Agregar decisión</h3>
            <label for="decitionText">Ingresa el texto de la decisión:</label>
            <br>
            <textarea name="decitionText" id="decitionText"></textarea>
            <br>
            <label for="mmType">Selecciona el tipo de mutlimedia:</label>
            <select name="mmType" onChange="showMmInput(this)">
            <option value="tipo">Tipo</option>
            <option value="image">Imagen</option>
            <option value="video">Video</option>
            <option value="audio">Audio</option>
            <option value="text">Texto</option>
          </select>
          <br>
            <div id="mmInputContainer">
              
            </div>
            <button id="btn_close_form" type="button" onclick="closeForm(this.parentNode.parentNode)">Close</button>
            <input type="submit" name="submitDecition" value="Agregar decisión">
            </form>
          `;
          $body.appendChild($decitionformContainer);
        } 
      },
      {
        // on mouse-over, highlight the node
        mouseDragEnter: (e, node) => (node.isHighlighted = true),
        mouseDragLeave: (e, node) => (node.isHighlighted = false),
        // on a mouse-drop add a link from the dropped-upon node to the new node
        mouseDrop: (e, node) => {
          const newnode = e.diagram.selection.first();
          if (!mayConnect(node, newnode)) return;
          const incoming = newnode.findLinksInto().first();
          if (incoming) e.diagram.remove(incoming);
          e.diagram.model.addLinkData({ from: node.key, to: newnode.key });
        },
      },
    );

    // define a Link template | Cambiar estilos o características de los enlaces 
    myDiagram.linkTemplate = $(
      go.Link,
      // two path Shapes: the transparent one becomes visible during mouse-over
      $(
        go.Shape,
        { isPanelMain: true, strokeWidth: 6, stroke: 'transparent' },
        new go.Binding('stroke', 'isHighlighted', (h) => (h ? 'lightblue' : 'transparent')).ofObject()
      ),
      
      $(go.Shape, { isPanelMain: true, strokeWidth: 2 }),
      $(go.Shape, { toArrow: 'Standard' }),
      {
        // on mouse-over, highlight the link
        mouseDragEnter: (e, link) => (link.isHighlighted = true),
        mouseDragLeave: (e, link) => (link.isHighlighted = false),
        // on a mouse-drop splice the new node in between the dropped-upon link's fromNode and toNode
        mouseDrop: (e, link) => {
          const oldto = link.toNode;
          const newnode = e.diagram.selection.first();
          if (!mayConnect(newnode, oldto)) return;
          if (!mayConnect(link.fromNode, newnode)) return;
          link.toNode = newnode;
          e.diagram.model.addLinkData({ from: newnode.key, to: oldto.key });
        },
      }
    );

    // Decide whether a link from node1 to node2 may be created by a drop operation
    function mayConnect(node1, node2) {
      return node1 !== node2;
    }

    // Modify the CommandHandler's doKeyDown to do nothing except bubble the event
    // on a potential Paste command:
    myDiagram.commandHandler.doKeyDown = function () {
      // method override must be function, not =>
      const diagram = this.diagram;
      const e = diagram.lastInput;
      // The meta (Command) key substitutes for "control" for Mac commands
      const control = e.meta || e.control;
      const shift = e.shift;
      const code = e.code;
      if (
        ((control && code === 'KeyV') || (shift && code === 'Insert')) &&
        (!diagram.commandHandler.canPasteSelection() || diagram.selection.count === 0)
      ) {
        // Instead of the usual behavior:
        // if (this.canPasteSelection()) this.pasteSelection();
        // let the event bubble up the DOM:
        e.bubbles = true;
      } else {
        go.CommandHandler.prototype.doKeyDown.call(this);
      }
    };

    // handle inserting a new node using text that is in the system clipboard
    document.addEventListener('paste', (e) => {
      const paste = e.clipboardData.getData('text');
      // Decide if the clipboard should be pasted, or if we should let GoJS paste
      // This sample pastes from the clipboard if it contains any text at all,
      // Otherwise, it pastes from GoJS
      if (paste.length > 0) {
        // Create a new node out of the text and paste it at the mouse location
        const loc = myDiagram.lastInput.documentPoint;
        const newdata = { text: paste, location: loc };
        myDiagram.model.addNodeData(newdata);
        const newnode = myDiagram.findNodeForData(newdata);
        if (newnode) myDiagram.select(newnode);
        // clear the GoJS clipboard
        myDiagram.commandHandler.copyToClipboard(null);
      } else {
        // If the clipbooard does not contain anything, paste from GoJS instead
        const commandHandler = myDiagram.commandHandler;
        if (commandHandler.canPasteSelection()) commandHandler.pasteSelection();
      }
    });

    myDiagram.model = new go.GraphLinksModel(
      [
        { key: 1, text: 'NombreHistoria', color: 'lightblue' },
        // { key: 2, text: 'Decisión 1', color: 'orange' },
        // { key: 3, text: 'Decisión 2', color: 'lightgreen' },
        // { key: 4, text: 'Delta', color: 'pink' },
      ],
      [
        // { from: 1, to: 2 },
        // { from: 1, to: 3 },
      ]
    );
  }
  
  function closeForm(formContainer){
    let $body = d.getElementById("body");
    $body.removeChild(formContainer);
}
  function showMmInput(mmSelector){
        const $mmInputContainer = d.getElementById("mmInputContainer");
        let uploadMMinfo;
        let selectedOption = mmSelector.value;
        // $mmInputContainer.removeChild($mmInputContainer.childNodes);
        $mmInputContainer.childNodes.forEach(child=>{
          $mmInputContainer.removeChild(child);
        })
        if(selectedOption == "image"){
          uploadMMinfo = `
            <label> Carga tu imagen </label>
            <br>
            <input type="file" accept="image/*">
            <br>
            <label> Carga un audio como multimedia adicional (opcional): </label>
            <br>
            <input type="file" accept="audio/*">   
          `                                          
        }else if(selectedOption == "video"){
          uploadMMinfo = `
          <label> Carga tu video </label>
          <br>
          <input type="file" accept="video/*">
          <br>
          <label> Carga multimedia secundaria: </label>
           <textarea rezise="none"></textarea>
        ` 
        }else if(selectedOption == "audio"){
          uploadMMinfo = `
          <label> Carga tu audio</label>
          <br>
          <input type="file" accept="audio/*">
          <br>
          <label> Carga multimedia secundaria: </label>
          <textarea rezise="none"></textarea>
        ` 
        }
        else if (selectedOption == "text"){
          uploadMMinfo = `
          <label>Escribe el texto de la decisión</label>
          <br>
          <textarea rezise="none"></textarea>
          <br>
          <label> Carga multimedia secundaria: </label>
          <br>

          <input type="file" accept="audio/*"> 
        ` 
        }else{
          uploadMMinfo = `
          `
        }
        $mmInputContainer.innerHTML = uploadMMinfo;
  }
  init();