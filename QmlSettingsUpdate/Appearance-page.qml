import QtQuick 2.8
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15

import QtQuick.Dialogs 1.0
Item {
    id: item1


    property var buttonNames : ["Styles","Style-config"]
    property var propertyIndex

StylePopup{
id:style;
}  

StyleConfig{
id:config
}
ListView{
anchors.fill: parent
clip:true
id:view


  header:Column{
      width: parent.width
      Repeater{
          model:buttonNames.length
          Button{
              id:pair
              width: parent.width
              text:buttonNames[index];
              font.pixelSize: 14
              height: window.mediumSize

          
		  onClicked:{
			if(index==0)
				style.open();
				else 
				config.open();
				
				
			
		  }

          }
      }
     
  }


  }

}

