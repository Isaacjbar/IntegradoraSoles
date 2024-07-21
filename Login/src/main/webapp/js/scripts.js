function init() {
    var $ = go.GraphObject.make;  // abreviatura para go.GraphObject.make

    var currentNode;  // Variable para guardar el nodo actual


    //Apartado para cambiar dinamicamente los inputs del form desplegable
    const $selector = document.getElementById("tipo-multimedia");
    const $hidden1 = document.getElementById("inputHidden1");
    const $hidden2 = document.getElementById("inputHidden2");
    const $labelHidden1 = document.getElementById("labelHidden1");
    const $labelHidden2 = document.getElementById("labelHidden2");
    $selector.addEventListener("change",(e)=>{
        let tipoMultimedia = e.target.value;
        $labelHidden1.innerText="";
        $hidden1.type = "hidden";
        $labelHidden2.innerText="";
        $hidden2.type = "hidden";
        if(tipoMultimedia == "Imagen"){
            $labelHidden1.innerText="Sube tu imagen";
            $hidden1.type = "file";
            $hidden1.accept = "image/*";
        }else if (tipoMultimedia == "Imagen y audio"){
            $labelHidden1.innerText="Sube tu imagen";
            $hidden1.type = "file";
            $hidden1.accept = "image/*";
            $labelHidden2.innerText="Sube tu audio";
            $hidden2.type = "file";
            $hidden2.accept = "audio/*";
        }else if (tipoMultimedia == "Video"){
            $labelHidden1.innerText="Sube tu video";
            $hidden1.type = "text";
            $hidden1.placeholder = "Ingresa la url del video";
        }else if (tipoMultimedia == "Audio"){
            $labelHidden1.innerText="Sube tu audio";
            $hidden1.type = "file";
            $hidden1.accept = "audio/*";
        }
    });
    //_________________________________________________________________________


    // función para añadir dos nodos hijos
    function addChildNodes(e, obj) {
        var node = obj.part.adornedPart;  // el nodo al que se le hace clic
        var diagram = node.diagram;
        diagram.startTransaction("add children");

        // contar hijos existentes
        var children = node.findTreeChildrenNodes().count;

        // Desactivar eliminación de nodos con la tecla Supr
        myDiagram.commandHandler.deleteSelection = function() {};

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

    // Función para eliminar un subárbol
    function deleteSubTree(node) {
        const nodesToDelete = [];
        const linksToDelete = [];

        node.findTreeParts().each(part => {
            if (part instanceof go.Node) {
                nodesToDelete.push(part);
            } else if (part instanceof go.Link) {
                linksToDelete.push(part);
            }
        });

        myDiagram.startTransaction("deleteSubTree");
        linksToDelete.forEach(link => myDiagram.remove(link));
        nodesToDelete.forEach(n => myDiagram.remove(n));
        myDiagram.commitTransaction("deleteSubTree");
    }

    // Función para borrar un nodo y su subárbol
    function deleteNodeAndSubTree(node) {
        var childNodes = node.findTreeChildrenNodes();

        // Mostrar advertencia si el nodo tiene hijos
        if (childNodes.count > 0) {
            var confirmation = confirm("Este nodo tiene nodos conectados. Si elimina este nodo, todos los nodos conectados también se eliminarán. ¿Quiere continuar?");
            if (!confirmation) return;
        }

        // Eliminar el nodo y su subárbol
        var diagram = node.diagram;
        diagram.startTransaction("delete node");
        deleteSubTree(node);
        diagram.commitTransaction("delete node");
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
                            $(go.TextBlock, "Añadir escenas"),
                            { click: addChildNodes }),
                        $("ContextMenuButton",
                            $(go.TextBlock, "Formulario"),
                            { click: showForm }),
                        $("ContextMenuButton",
                            $(go.TextBlock, "Eliminar Nodo"),
                            {
                                click: function(e, obj) {
                                    var node = obj.part.adornedPart;
                                    deleteNodeAndSubTree(node); // Llamar a la función de borrado
                                }
                            })
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
