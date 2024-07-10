function init() {
  var $ = go.GraphObject.make;  // abreviatura para go.GraphObject.make

  var currentNode;  // Variable para guardar el nodo actual

  // función para añadir dos nodos hijos
  function addChildNodes(e, obj) {
    var node = obj.part.adornedPart;  // el nodo al que se le hace clic
    var diagram = node.diagram;
    diagram.startTransaction("add children");

    // contar hijos existentes
    var children = node.findTreeChildrenNodes().count;

    if (children < 2) {
      for (var i = 0; i < 2; i++) {
        var newKey = diagram.model.nodeDataArray.length + 1;
        var newNodeData = { key: newKey, parent: node.data.key, name: newKey };
        diagram.model.addNodeData(newNodeData);
      }
    } else {
      alert("No puede añadir más de dos nodos hijos");
    }

    diagram.commitTransaction("add children");
  }

  function showForm(e, obj) {
    currentNode = obj.part.adornedPart;  // el nodo al que se le hace clic
    document.getElementById('myOverlay').style.display = 'flex';
    document.getElementById('nodeName').value = currentNode.data.name;
    document.getElementById('nodeDesc').value = currentNode.data.description || '';
    myDiagram.div.style.pointerEvents = 'none'; // Disable interactions with the diagram
  }

  // función para guardar los datos del formulario
  function saveForm() {
    var nodeName = document.getElementById('nodeName').value;
    var nodeDesc = document.getElementById('nodeDesc').value;
    var diagram = currentNode.diagram;
    diagram.startTransaction("save form");
    diagram.model.setDataProperty(currentNode.data, "name", nodeName);
    diagram.model.setDataProperty(currentNode.data, "description", nodeDesc);
    diagram.commitTransaction("save form");
    hideForm();
  }

  // función para cancelar el formulario
  function cancelForm() {
    hideForm();
  }

  // función para ocultar el formulario y mostrar el diagrama
  function hideForm() {
    document.getElementById('myOverlay').style.display = 'none';
    myDiagram.div.style.pointerEvents = 'auto'; // Re-enable interactions with the diagram
  }

  // define una plantilla de nodo simple con un menú contextual
  myDiagram = $(go.Diagram, "myDiagramDiv",  // debe coincidir con el ID del div en HTML
      {
        layout: $(go.TreeLayout, { angle: 90, layerSpacing: 35 })
      });

  myDiagram.nodeTemplate =
      $(go.Node, "Auto",
          $(go.Shape, "RoundedRectangle",
              {
                fill: $(go.Brush, "Linear", { 0: "#0A7890", 1: "#0B8884" }),  // Gradient color
                stroke: null,
                width: 150, // Adjust width according to your needs
                height: 70, // Adjust height according to your needs
                figure: "RoundedRectangle",
                parameter1: 10, // corner radius
              }),
          $(go.Panel, "Vertical",
              $(go.TextBlock, "Default Text",
                  {
                    margin: 12,
                    stroke: "white",
                    font: "14px Arial",
                    textAlign: "center",
                    wrap: go.TextBlock.WrapFit,
                    width: 140 // Adjust width according to your needs
                  },
                  new go.Binding("text", "name")),
              $(go.TextBlock, "",
                  {
                    margin: 12,
                    stroke: "white",
                    font: "12px Arial",
                    textAlign: "center",
                    wrap: go.TextBlock.WrapFit,
                    width: 140 // Adjust width according to your needs
                  },
                  new go.Binding("text", "description"))
          ),
          {
            contextMenu:  // define un menú contextual para el nodo
                $("ContextMenu",
                    $("ContextMenuButton",
                        $(go.TextBlock, "Add Children"),
                        { click: addChildNodes }),
                    $("ContextMenuButton",
                        $(go.TextBlock, "Formulario"),
                        { click: showForm })
                )
          }
      );

  // define un modelo de árbol simple
  var model = $(go.TreeModel);
  model.nodeDataArray = [
    { key: "1", name: "A", description: "Proyecto integrador" }
  ];
  myDiagram.model = model;

  // Exponer las funciones saveForm y cancelForm globalmente
  window.saveForm = saveForm;
  window.cancelForm = cancelForm;
}

window.addEventListener('DOMContentLoaded', init);
