# LiveLine :health_worker: :stethoscope:
## Background Study - 
- During the covid 19 period, many lives could be saved if they have been admitted early into hospital. People had faced difficulty in breathing due to decrement in oxygen saturation level in their blood. The early they know about their SpO2 concentration , they faster they can start therpy
- It is important to identify whether your heart rate sits within the normal range. If disease or injury weakens the heart, the organs will not receive enough blood to function normally. 
- Heart attack became common to middle age people, Many a time they find themselves alone in this situation. If the family member can get aware they can approach the person at the earliest.
- For any infectious disease — one of the cardinal signs of infection is raised body temperature. Increasing body temperature is a symbol of virus/bacteria intrusion inside the body
- If a person has a fever with a dry cough, they may have symptoms of COVID-19.

## About this Project - 
From the background study, we can say that the early we get info about symptoms/abnormal movement of our body, the more chance we have to save ourselves from disease/severe attacks. 
<br/>
With the help of sensor, we are building a **Health Monitoring/Awareness/Risk-Alert** App which will display a Person's Heart rate, SpO2 (oxygen% in the body) level concentration and body temperature. Using MAX30100 Heart Rate Sensor we are measuring all these value and with the help of NodeMCU we are sending all these data to firebase cloud which will fetched by LiveLine app made with flutter and dart and displayed in the App. All the memeber can monitor their family member vitals and furthermore any abnormality in pulse rate/oxygen concentraion will be alerted to user and mail to other family member.Using standerd value, the current condition will be displayed in the app.

## Components  -
1. [MAX30100 Heart Rate Sensor](https://robu.in/product/max30100-pulse-oximeter-heart-rate-sensor-module/)
2. [NodeMCU](https://www.amazon.in/ESP8266-NodeMcu-WiFi-Development-Board/dp/B00UY8C3N0)
3. [Power batteries](https://www.amazon.in/Powercell-Gold-Batteries-Power-Pack/dp/B08WCKLRQT/ref=sr_1_3?crid=2FFFL54ZN4OOL&keywords=power+cell&qid=1654173497&sprefix=power+cell%2Caps%2C231&sr=8-3)
4. [jumper wires](https://www.amazon.in/ApTechDeals-Jumper-Female-breadboard-jumper/dp/B074J9CPV3/ref=sr_1_5?crid=2DEY031WSKATL&keywords=jumper+wires&qid=1654174197&sprefix=jumper+wire%2Caps%2C423&sr=8-5)

## MAX30100 working -
The MAX30100 consists of a pair of high-intensity LEDs (RED and IR, both of different wavelengths) and a photodetector. The wavelengths of these LEDs are 660nm and 880nm, respectively.The MAX30100 works by shining both lights onto the finger or earlobe (or essentially anywhere where the skin isn’t too thick, so both lights can easily penetrate the tissue) and measuring the amount of reflected light using a photodetector.The oxygenated hemoglobin (HbO2) in the arterial blood has the characteristic of absorbing IR light. The redder the blood (the higher the hemoglobin), the more IR light is absorbed. As the blood is pumped through the finger with each heartbeat, the amount of reflected light changes, creating a changing waveform at the output of the photodetector. As you continue to shine light and take photodetector readings, you quickly start to get a heart-beat (HR) pulse reading.
<br/>
Pulse oximetry is based on the principle that the amount of RED and IR light absorbed varies depending on the amount of oxygen in your blood. The following graph is the absorption-spectrum of oxygenated hemoglobin (HbO2) and deoxygenated hemoglobin (Hb).
As you can the last graph, deoxygenated blood absorbs more RED light (660nm), while oxygenated blood absorbs more IR light (880nm). By measuring the ratio of IR and RED light received by the photodetector, the oxygen level (SpO2) in the blood is calculated.
<span style="margin-right: 30px;">
<img src="https://lastminuteengineers.b-cdn.net/wp-content/uploads/arduino/MAX30100-Pulse-Detection-Photoplethysmogram.png"> 
<img src="https://user-images.githubusercontent.com/75129076/171642505-6d709771-1474-448c-9af2-b5e92c33a7ab.png" >
 </span>
<p align="center">
  <img src="https://user-images.githubusercontent.com/75129076/171643500-b8e40bcf-c2e2-49d7-acc7-4991532460ef.png" />
</p>
 
 ## Hardware Connection -
 MAX30100 PIN   | NodeMCU PIN
 --------- | --------
 SCL | D1
 SDA | D2
 Vin | 3V3
 GND | GND
 
<!-- <img src="https://user-images.githubusercontent.com/75129076/171643972-eea09b4a-4b61-4d8a-8cc3-6a3953a7559a.png" width="400" > -->
<p align="center">
  <img src="https://user-images.githubusercontent.com/75129076/171643972-eea09b4a-4b61-4d8a-8cc3-6a3953a7559a.png" width="400" />
</p>

plug NodeMCU with a USB cable.

## software Guide
- Copy the code from  [LiveLine.ino file](https://github.com/user/repo/blob/branch/other_file.md) and paste in Arduino IDE.
- To install the library navigate to the Sketch > Include Library > Manage Libraries… Wait for Library Manager to download libraries index and update list of installed libraries.
- Filter your search by typing max30100. There should be a couple entries. Look for MAX30100lib Library by OXullo Intersecans. Click on the entry, and then select Install.
- Create a Firebase project from [console](https://console.firebase.google.com/).
- Go to Console->Database->Rules and remove auth request writing following data: (WARNING: don't do it for production appplications!)
```json
{
  "rules": {
    ".read": true,
    ".write": true
  }
}
``` 
- Click on the settings/cog wheel icon next to your project name at the top of the new Firebase Console
- Click Project settings
- Click on the Service Account tab
- Click on the Database Secrets link in the inner left-nav
- Hover over the non-displayed secret and click Show
- Copy Auth ID of firebase and Also the host address
- Paste the two values along with the code and  change wifi SSID and Password (Note that wifi band must be 2.4GHz)
- upload the code into NodeMCU
- press your finger on the sensor and you can see below image in serial monitor
![image](https://user-images.githubusercontent.com/75129076/171648453-be18e114-a4c9-44b3-91ed-1ef2cc97198b.png)
 
