sca;
close all;
clearvars;

PsychDefaultSetup(2);

screens = Screen('Screens');
screenNumber = max(screens);

white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

ifi = Screen('GetFlipInterval', window);

[xCenter, yCenter] = RectCenter(windowRect);

baseRect = [0 0 200 200];
rectColor = [1 0 0];

amplitude = screenXpixels * 0.25;
frequency = 0.2;
angFreq = 2 * pi * frequency;
startPhase = 0;
time = 0;

vbl = Screen('Flip', window);
waitframes = 1;

topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);

while ~KbCheck
    
    xpos = amplitude * sin(angFreq * time + startPhase);
    
    % Use the x position of the square to determine its color
    sizeMultiplier = abs(xpos) / amplitude;
    
    squareXpos = xCenter + xpos;
    
    centeredRect = CenterRectOnPointd(baseRect * sizeMultiplier,...
        squareXpos, yCenter);
    
    Screen('FillRect', window, rectColor, centeredRect);
    
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    
    time = time + ifi;
    
end

sca;