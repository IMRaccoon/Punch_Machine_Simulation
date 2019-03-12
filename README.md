# Punch_Machine_Simulation


This is the simulation of Punch machine.  
It was created during the university project and used MATLAB.  
The project is only for Android.
(Actually, I haven't with IOS.)

The main Purpose is **find the path** of punch, and **expect the score** through the sensor data of cell phone.

The sub Purpose is get **more specific score** person by person through their height, and weight.

## Process of Developing
1. Connection between MATLAB and cellphone data.
    * Share the sensor data by *MATLAB mobile application*. 
2. Trace the route of cell phone through the **Acceleration, Orientation sensor value**.
    * Calculates Acceleration and Orientation data to produce *pure Acceleration without gravity*.
    * Estimate its position by *double integral method*.
3. Predict users' scores through **learning data**.
    * By 'linear regression', the regression equation of velocity values, height and weight of the x, y and z axes is modeled.
    * Predict scores from learning data from previous process.
4. By **setting the lower limit** of acceleration, only practical movements are implemented.
    * Omit the value of the movement of a certain lower value.
    * Calculates real movement data makes more efficiently.
