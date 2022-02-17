import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.0
Popup{
id:item
width:parent.width
height:parent.height


MouseArea{
       
        anchors.fill:parent
        acceptedButtons: Qt.BackButton
        onPressed: {
		
          item.close();
        }
    }

Component.onCompleted: {

    var currentGroup =""
    

    for(var property in themeData){
        var value =themeData[property];
       

        if(currentGroup!==value[0]&&value[0]!==undefined){
        var componente = Qt.createComponent("LabelMenuSeparator.qml")
		console.log("HERE");

        componente.createObject(column,{text:value[0]});
            currentGroup=value[0];
        }


        if(value[0]==="Color"){
            var button =buttonComponent.createObject(column,{"prop":property,"data":value,"width":parent.width,"height":74});

        }else if(value[0]==="Switch"){

            var sw =switchComponent.createObject(column,{"text":property,"prop":property,"data":value,"width":parent.width,"height":74});

        }else if(value[0]==="Buttons"){

            if(property.indexOf("_array")>-1){

                var key =property.replace("_array","");
                var val =themeData[key];

               var b =bComponent.createObject(column,{"text":val[1],"prop":key,"data":value,"width":parent.width,"height":74});

            }
       }else if(value[0]==="Sliders"){
            if(property.indexOf("_array")>-1){
                console.log(property);
                var svKey =property.replace("_array","");
                var sv =themeData[svKey];
                console.log(sv,svKey);

               var sl =sComponent.createObject(column,{"dataValue":sv[1],"prop":svKey,"propArray":property,"data":value,"width":parent.width,"height":74});

            }
        }else if(value[0]==="Font"){
            var fonts =["Font",Qt.fontFamilies()];
             var fb =bComponent.createObject(column,{"text":value[1],"prop":property,"data":fonts,"width":parent.width,"height":74});
        }



    }


}
ColorDialog {
    id: colorDialog

    property var data
    property var button
    property var prop

    onAccepted: {

        msg.writeSettings(prop,data[0],colorDialog.color);

        button.text=colorDialog.color
    }


}

Popup{

    id:popup
    visible: false
   width: parent.width
   height: parent.height

   property var prop
modal:true
  property var values:[]
  property var group

property var choose

property var button
MouseArea{
       
        anchors.fill:parent
        acceptedButtons: Qt.BackButton
        onPressed: {
		
          popup.close();
        }
    }
ListView{
anchors.fill: parent
clip:true
id:view
 header:Column{
    id:col
width: parent.width

        Repeater{
            model:popup.values.length
            delegate: Button{
                text:popup.values[index]
				highlighted:popup.button.text===text;
				width:parent.width
                onClicked: {
                      msg.writeSettings(popup.prop,popup.group,popup.values[index]);
					  
                 popup.button.text=popup.values[index];
                    popup.close();


                }
            }

        }

    }
	}

}

Component{
 id:switchComponent
 Switch{
     id:sw
     property var prop


     property var data
     checked: data[1]==="true" ?  true:false
onCheckedChanged: {

       msg.writeSettings(prop,data[0],checked);
}

 }

}



Component{
 id:bComponent

 Button{

id:button

      property var data
	 

     property var prop
     onClicked: {
		if(data[1].lenght>1)
			popup.values=data[1].split(",");
         else
		   popup.values=data[1]
		 
		 popup.prop=prop
         popup.group=data[0];
         popup.button=button;
         popup.open();



     }





 }


}
Component{
    id:rect
    Rectangle{
     width: 32
     height:width


     x:parent.contentItem.leftPadding >=width/2&& parent.contentItem.leftPadding<=parent.width/2? parent.width-width*2 : 0

     y:parent.height/2-height/2
     border.color: color.hslLightness > 0.5 ?"black":"white"
         border.width:1


    }

}

Component{
    id:sComponent

    Slider{
        property var prop
         property var data
        property  var minMax: data[1].split(",");

         property var dataValue

        from:minMax[0];
        to:minMax[1];
        value:dataValue
      
        onValueChanged: {
             msg.writeSettings(prop,data[0],value);
        }

    }

}

Component{
 id:buttonComponent


 Button{

     property var prop
      property var data

    id:button


    text:button.data[1];

    property  var rectangle

    onClicked: {

        colorDialog.prop=button.prop;
         colorDialog.data=button.data;
         colorDialog.button=button;
         colorDialog.open();

     }
    onTextChanged: {


        rectangle.color=text


    }

    Component.onCompleted: {
        rectangle=rect.createObject(button,{"color":data[1]});
    }


}




}

    Column{
        id:column
			width:listView.width




       }
	   




}