#ifndef COLORMANAGER_H
#define COLORMANAGER_H

#include <QQmlContext>
#include <QObject>
#include <QVariantList>
#include <QSettings>
#include <QQuickStyle>
#include <QDebug>
#include <QQmlPropertyMap>

class ColorManager : public QObject
{
    Q_OBJECT
   

public:
 QQmlPropertyMap data;

 Q_INVOKABLE QVariant value(QString key){

     return data.value(key);
 }


 Q_INVOKABLE void  writeSettings(QString key ,QString group,QString color){


    QSettings settings(QSettings::NativeFormat,QSettings::UserScope,QQuickStyle::name(), "Themes");

    settings.beginGroup(group);


    settings.setValue(key,color);
     settings.sync();
      settings.endGroup();
       settings.sync();




 }


QVariantList reload(){

        QVariantList colorList;
        QVariantList colorNameList;


        QSettings settings(QSettings::NativeFormat,QSettings::UserScope,QQuickStyle::name(), "Themes");
          QStringList groups =settings.childGroups();

        for(int i=0;i<groups.size();i++){
			
        settings.beginGroup(groups.at(i));
        QStringList childKeys = settings.childKeys();
        foreach (const QString &childKey, childKeys){
			qDebug()<<settings.value(childKey);
         

			
           data.insert(childKey,QVariant::fromValue(QVariantList{groups.at(i),settings.value(childKey)}));

          


          }
          settings.endGroup();
        }

       
		qDebug()<<data.value("background");




               return colorList;

    }
  


public slots:
    void settings(const QString& str)
    {
        Q_UNUSED(str)
		reload();

    }
private:
  
};


#endif // MESSAGE_H



