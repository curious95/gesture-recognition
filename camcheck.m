function [ camera_name, camera_id, resolution ] = camcheck()

display('Camera Check Started');
a=imaqhwinfo%a gets the hardware information
c=imaqhwinfo('winvideo')%here c stores winvideo info selected
b=c.DeviceIDs %here b gets the no of camera output devices

camera_name = char(a.InstalledAdaptors(1))

[p,q]=size(b)

if (q==0)
   nohw= errordlg('No Compatible Hardware Found','ERROR' );%error if no Hardware
else
   switch q,
     case 1,
       camera_name = char(a.InstalledAdaptors(end));
       camera_info = imaqhwinfo(camera_name);
       camera_id = camera_info.DeviceInfo(1).DeviceID(end);
       resolution = char(camera_info.DeviceInfo(1).SupportedFormats(end));
     case 2,
         
        hw2= questdlg('Select Device For Input Video', ...
                         'Select The Input Device', ...
                         c.DeviceInfo(1).DeviceName, c.DeviceInfo(2).DeviceName,c.DeviceInfo(1).DeviceName );
                     if strcmp(hw2 , c.DeviceInfo(1).DeviceName)==1
                         camera_name = char(a.InstalledAdaptors);
                         camera_info = imaqhwinfo(camera_name);

                         camera_id = camera_info.DeviceInfo(1).DeviceID(end);
                         resolution = char(camera_info.DeviceInfo(1).SupportedFormats(end));
                     
                     else  if strcmp(hw2,c.DeviceInfo(2).DeviceName)==1
                         camera_name = char(a.InstalledAdaptors(end));
                         camera_info = imaqhwinfo(camera_name);
                         camera_id = camera_info.DeviceInfo(2).DeviceID(end);
                         resolution = char(camera_info.DeviceInfo(2).SupportedFormats(end));
                           end 
                     
                     end    
      case 3,
            
          hw2= questdlg('Select Device For Input Video', ...
                         'Select The Input Device', ...
                         c.DeviceInfo(1).DeviceName, c.DeviceInfo(2).DeviceName,c.DeviceInfo(3).DeviceName,c.DeviceInfo(1).DeviceName );
                     if  strcmp(hw2,c.DeviceInfo(1).DeviceName)==1
                         camera_name = char(a.InstalledAdaptors(end));
                         camera_info = imaqhwinfo(camera_name);
                         camera_id = camera_info.DeviceInfo(1).DeviceID(end);
                         resolution = char(camera_info.DeviceInfo(1).SupportedFormats(end));
                     end
                     if strcmp(hw2,c.DeviceInfo(2).DeviceName)==1
                         camera_name = char(a.InstalledAdaptors(end));
                         camera_info = imaqhwinfo(camera_name);
                         camera_id = camera_info.DeviceInfo(2).DeviceID(end);
                         resolution = char(camera_info.DeviceInfo(2).SupportedFormats(end));
                     end    
                     if strcmp(hw2,c.DeviceInfo(3).DeviceName)==1
                         camera_name = char(a.InstalledAdaptors(end));
                         camera_info = imaqhwinfo(camera_name);
                         camera_id = camera_info.DeviceInfo(3).DeviceID(end);
                         resolution = char(camera_info.DeviceInfo(3).SupportedFormats(end));
                     end    
          
   end % switch    

end
 
end

