function init() {
    var $ = go.GraphObject.make;  // abreviatura para go.GraphObject.make

    var currentNode;  // Variable para guardar el nodo actual

    function addChildNodes(e, obj) {
        var node = obj.part.adornedPart;  // el nodo al que se le hace clic
        var diagram = node.diagram;
        diagram.startTransaction("add children");

        // contar hijos existentes
        var children = node.findTreeChildrenNodes().count;

        // Desactivar eliminación de nodos con la tecla Supr
        myDiagram.commandHandler.deleteSelection = function() {};

        if (children < 2) {
            var parentId = node.data.key;
            var historiaId = node.data.historiaId;

            if (!historiaId) {
                // Obtener historiaId de la URL si no está presente en los datos del nodo
                var urlParams = new URLSearchParams(window.location.search);
                historiaId = urlParams.get('id_his');
            }

            console.log("Parent ID:", parentId); // Depuración
            console.log("Historia ID:", historiaId); // Depuración

            // Enviar las nuevas escenas y decisiones al nuevo servlet para guardarlas en la base de datos
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "AddChildNodesServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Procesar la respuesta del servidor
                    var response = JSON.parse(xhr.responseText);
                    response.newNodes.forEach(function(nodeData) {
                        diagram.model.addNodeData(nodeData);
                        var linkData = { from: parentId, to: nodeData.key, text: "Decisión " + nodeData.key };
                        diagram.model.addLinkData(linkData);
                    });
                }
            };

            var data = "action=addChildNodes&parentId=" + encodeURIComponent(parentId) +
                "&historiaId=" + encodeURIComponent(historiaId);

            console.log("Sending data: " + data); // Agregar log de depuración

            xhr.send(data);
        } else {
            alert("No puede añadir más de dos nodos hijos");
        }

        diagram.commitTransaction("add children");
    }




    function showForm(e, obj) {
        currentNode = obj.part.adornedPart;  // el nodo al que se le hace clic
        document.getElementById('myOverlay').style.display = 'flex';
        document.getElementById('key').value = currentNode.data.key; // Establece el ID del nodo
        document.getElementById('nodeName').value = currentNode.data.name;
        document.getElementById('nodeDesc').value = currentNode.data.description || '';
        document.getElementById('nodeImage').value = currentNode.data.image || '';
        document.getElementById('nodeAudio').value = currentNode.data.audio || '';
        document.getElementById('nodeVideo').value = currentNode.data.video || '';
        myDiagram.div.style.pointerEvents = 'none'; // Disable interactions with the diagram

        // Mostrar el video si la URL está presente
        const videoUrl = currentNode.data.video || '';
        if (videoUrl) {
            document.getElementById('youtubePlayer').src = videoUrl;
        } else {
            document.getElementById('youtubePlayer').src = '';
        }

        // Agregar logs de depuración
        console.log("showForm - currentNode data:", currentNode.data);
        console.log("showForm - node ID set to:", currentNode.data.key);
    }

    // función para guardar los datos del formulario
    function saveForm() {
        var nodeId = document.getElementById('key').value;
        var nodeName = document.getElementById('nodeName').value;
        var nodeDesc = document.getElementById('nodeDesc').value;
        var nodeImage = document.getElementById('nodeImage').value;
        var nodeAudio = document.getElementById('nodeAudio').value;
        var nodeVideo = document.getElementById('nodeVideo').value;
        var diagram = currentNode.diagram;

        // Agregar logs de depuración
        console.log("saveForm - nodeId:", nodeId);
        console.log("saveForm - nodeName:", nodeName);
        console.log("saveForm - nodeDesc:", nodeDesc);
        console.log("saveForm - nodeImage:", nodeImage);
        console.log("saveForm - nodeAudio:", nodeAudio);
        console.log("saveForm - nodeVideo:", nodeVideo);

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "gestionEscenaServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                diagram.startTransaction("save form");
                diagram.model.setDataProperty(currentNode.data, "name", nodeName);
                diagram.model.setDataProperty(currentNode.data, "description", nodeDesc);
                diagram.model.setDataProperty(currentNode.data, "image", nodeImage);
                diagram.model.setDataProperty(currentNode.data, "audio", nodeAudio);
                diagram.model.setDataProperty(currentNode.data, "video", nodeVideo);
                diagram.commitTransaction("save form");
                hideForm();
            }
        };

        var data = "id=" + encodeURIComponent(nodeId) +
            "&historiaId=" + encodeURIComponent(historiaId) +
            "&titulo=" + encodeURIComponent(nodeName) +
            "&descripcion=" + encodeURIComponent(nodeDesc) +
            "&imagen=" + encodeURIComponent(nodeImage) +
            "&audio=" + encodeURIComponent(nodeAudio) +
            "&video=" + encodeURIComponent(nodeVideo) ;

        // Agregar logs de depuración
        console.log("saveForm - data sent:", data);

        xhr.send(data);
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
                    fill: $(go.Brush, "Linear", { 0: "#0A7890", 1: "#0B8884" }),  // Color de degradado
                    stroke: null,
                    width: 200, // Ajustar ancho según sea necesario
                    height: 300, // Ajustar altura según sea necesario
                    figure: "RoundedRectangle",
                    parameter1: 10, // radio de la esquina
                }),
            $(go.Panel, "Vertical",
                $(go.TextBlock, "Default Text",
                    {
                        margin: 6,
                        stroke: "white",
                        font: "14px Arial",
                        textAlign: "center",
                        wrap: go.TextBlock.WrapFit,
                        width: 180 // Ajustar ancho según sea necesario
                    },
                    new go.Binding("text", "name")),
                $(go.TextBlock, "",
                    {
                        margin: 6,
                        stroke: "white",
                        font: "12px Arial",
                        textAlign: "center",
                        wrap: go.TextBlock.WrapFit,
                        width: 180 // Ajustar ancho según sea necesario
                    },
                    new go.Binding("text", "description")),
                $(go.Picture,
                    {
                        margin: 6,
                        width: 50,
                        height: 50,
                        visible: false, // Inicialmente oculto, se mostrará si hay una imagen
                    },
                    new go.Binding("source", "image"),
                    new go.Binding("visible", "image", function(img) { return img ? true : false; })),
                $(go.TextBlock, "Audio: ",
                    {
                        margin: 6,
                        stroke: "white",
                        font: "12px Arial",
                        textAlign: "center",
                        visible: false, // Inicialmente oculto, se mostrará si hay audio
                    },
                    new go.Binding("visible", "audio", function(audio) { return audio ? true : false; })),
                $(go.TextBlock, "Video: ",
                    {
                        margin: 6,
                        stroke: "white",
                        font: "12px Arial",
                        textAlign: "center",
                        visible: false, // Inicialmente oculto, se mostrará si hay video
                    },
                    new go.Binding("visible", "video", function(video) { return video ? true : false; }))
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

    myDiagram.linkTemplate =
        $(go.Link,
            $(go.Shape),
            $(go.Shape, { toArrow: "Standard" }),
            $(go.TextBlock,
                { segmentOffset: new go.Point(0, -10), font: "12px Arial", stroke: "black" },
                new go.Binding("text", "text"))
        );

    // Función para mostrar video de YouTube
    function showYouTubeVideo() {
        const youtubeLink = document.getElementById("youtubeLink").value;
        const youtubePlayer = document.getElementById("youtubePlayer");

        if (youtubeLink) {
            let videoId = youtubeLink.split('v=')[1];
            const ampersandPosition = videoId.indexOf('&');
            if (ampersandPosition !== -1) {
                videoId = videoId.substring(0, ampersandPosition);
            }
            youtubePlayer.src = `https://www.youtube.com/embed/${videoId}`;
            youtubePlayer.style.display = "block";
        }
    }

    // Cargar los datos del servidor
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "gestionEscenaServlet?accion=cargarEscenas&historiaId=" + historiaId, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            var nodeDataArray = response.nodeDataArray;
            var linkDataArray = response.linkDataArray;
            var model = new go.GraphLinksModel(nodeDataArray, linkDataArray);
            myDiagram.model = model;

            // Log de los datos cargados
            console.log("Diagram data loaded:");
            console.log("Node Data Array:", nodeDataArray);
            console.log("Link Data Array:", linkDataArray);
        }
    };
    xhr.send();

    // Exponer las funciones saveForm y cancelForm globalmente
    window.saveForm = saveForm;
    window.cancelForm = cancelForm;
}

window.addEventListener('DOMContentLoaded', init);
