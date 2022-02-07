% Image Processing
% Author: J. Matthew Myers
% Distributed under the terms of the GNU GPLv3 License
% Written 02/04/2022

% Execute the main function
main;

% grayBW
% Takes an image as the argument
% Converts the image from grayscale to black and white based on a user-defined threshold
function grayBW(img)
    % Prompt for threshold value within 0 and 255
    thresh = -1;
    while thresh < 0 || thresh > 255
        thresh = input('Threshold: ');
    end
    
    % Define size of image
    [nrows, ncol] = size(img);
    
    % Define new image array
    nimg = zeros(nrows, ncol);
    
    % Loop to create new image array consisting of black and white version of
    % the original image
    for i = 1:ncol
        for j = 1:nrows
            % Check against threshold
            
            % Lighter
            if img(j, i) > thresh
                % Set to black
                nimg(j,i) = 255;
            % Darker
            elseif img(j, i) < thresh
                % Set to white
                nimg(j,i) = 0;
            end
        end
    end
    
    % Display the original image and new image in separate windows
    figure(1); imshow(img);
    figure(2); imshow(nimg);
end

% brightness
% Takes an image as the argument
% Adjusts the brightness of the image based on a user-defined level
function brightness(img)
    % Get brightness percent from user
    level = -1;
    while level < 0 || level > 100
        level = input('Brightness %: ');
    end
    % Display original
    figure(1); imshow(img);
    % Adjust brightness and display
    if level == 50
        figure(2); imshow(img);
    end
    if level < 50 || level > 50
        img = img * (level / 100);
        figure(2); imshow(img);
    end
end

% crop
% Takes an image as the argument
% Crops the image based on user-defined coordinates within the image
function crop(img)
    % Define image size
    [rows, cols] = size(img);
    
    % Prompt user for starting position and size of portion of image to crop
    srow = input('Please enter the starting row: ');
    scol = input('Please enter the starting column: ');
    nrows = input('Please enter the number of rows: ');
    ncols = input('Please enter the number of columns: ');
    
    % Define new image array
    nimg = zeros(nrows-srow, ncols-scol);
    
    % Using loops create new image array for new image
    for i = 1:ncols
        for j = 1:nrows
            % Set new image data to original image data
            nimg(j,i) = img(srow+j,scol+i);
        end
    end
    
    % Display the original image and new image in separate windows
    figure(1); imshow(img);
    figure(2); imshow(uint8(nimg));
end

% main
function main
    % Load picture
    filename = input('Image filename: ');
    img = imread(filename);
    
    % Prompt user for function
    disp('1. Grayscale/BW');
    disp('2. Brightness');
    disp('3. Crop');
    choice = input('Choice: ');

    % Select appropriate action
    if choice == 1
        grayBW(img);
    end
    if choice == 2
        brightness(img);
    end
    if choice == 3
        crop(img);
    end
end

