# EPR

Here's how to use:
1. Add the 2 .JPG files for analysis and save them in your matlab folder containing this function 
(name them thoughtfully in the following way:
Mesh_min#_max#_Run#_i and Mesh_min#_max#_Run#_f, 
e.g., if I'm using the 100-140 mesh sand and I'm on my fifth run, I'd save as
'Mesh_100_140_Run5_i.JPG' and 'Mesh_100_140_Run5_f.JPG')

2. (Add the function to path if needed)

3. Call function as: 
[ratio_i, ratio_f, percent] = fn_sandcounter('File_i.JPG','File_f.JPG')
e.g.,
[r1, r2, premoved] = fn_sandcounter('Feb_18_Test8_i.JPG','Feb_18_Test8_f.JPG')

4. A picture box will appear with the title prompting you to crop the image. Click and drag a box around what's valid for testing, then right click the box you've made and select "crop image"

5. It will run and output a bunch of fun stuff including premoved or percentRemoved, which is aptly named since it's your percent removed!
