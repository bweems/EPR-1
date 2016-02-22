%% fn_sandcounter.m

% This function takes in 2 images, counts the light spots, and gives the
% amount of each before giving a "% removed"

%%%%%%%%%%%%%%%%%%%% DEFINITIONS %%%%%%%%%%%%%%%%%%%%
%
% filenamei/filenamef : name of initial/final plate image
% image_i/image_f : original color initial/final plate image
% mi x ni : size of cropped image_i
% mf x nf : size of cropped image_f
% image_ii/image_ff: image_i/image_f, converted to binary white & black
% blackcount_i/blackcount_f : total # black pixels in image_ii/image_ff
% ratio1 : # white pixels initially divided by # total pixels
% ratio2 : # white pixels finally divided by # total pixels
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ratio1, ratio2, percentRemoved] = fn_sandcounter(filenamei, filenamef)


image_i = imread([filenamei]);
image_i = imrotate(image_i, -90);
image_f = imread([filenamef]);
image_f = imrotate(image_f, -90);

size(image_i)
imshow(image_i);            % Show a sample image for 2 image set
title('Crop Scale Now');    % Titles to instruct user
[image_i, cropset] = imcrop();     % collect cropping data
[rowa, cola] = size(image_i)
image_f = imcrop(image_f,cropset);

%image_i = (image_i(1500:2450,450:1750,:)); %1450

%image_f = (image_f(1500:2450,450:1750,:));

toti = size(image_i);
totf = size(image_f);
mi = toti(1)
ni = toti(2)
mf = totf(1)
nf = totf(2)

image_i = rgb2gray(image_i); % ii
image_f = rgb2gray(image_f); % ff
image_ii = 255*(image_i>45); %ii 
image_ff = 255*(image_f>45); %ff

blackcount_i = sum(sum(image_ii == 0))
whitecount_i = sum(sum(image_ii))
blackcount_f = sum(sum(image_ff == 0))
whitecount_f = sum(sum(image_ff))

ratio1 = whitecount_i / (whitecount_i+blackcount_i)
ratio2 = whitecount_f / (whitecount_f+blackcount_f)

subplot(2,2,1),
imshow(image_i)
subplot(2,2,2),
imshow(image_f)
subplot(2,2,3),
imshow(image_ii)
subplot(2,2,4),
imshow(image_ff)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following code will find the "average y value" of white pixels in
% each photo, thus allowing us to know how much the sand has generally
% moved down the panel.

totali = 0; % Total sum of each white pixel's y-coordinate
totalf = 0;
counti = 0; % Total sum of white pixels in the photo
countf = 0;
for i = 1:mi
    for ii = 1:ni
        if image_i(i,ii)
            counti = counti + 1;
            totali = totali + i;
        end
    end
end
for f = 1:mf
    for ff = 1:nf
        if image_f(f,ff)
            countf = countf + 1;
            totalf = totalf + f;
        end
    end
end

% average y-coord for initial
avgY_init = totali/counti

% average y-coord for final
avgY_final = totalf/countf

% end of average y value code :/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following code will find a distribution of the amount of sand
% distributed by each y-location,


percentRemoved = (whitecount_i - whitecount_f)/whitecount_i*100 % :)

end
