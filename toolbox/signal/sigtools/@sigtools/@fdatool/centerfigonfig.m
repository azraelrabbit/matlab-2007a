function centerfigonfig(hFDA, hmsg)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hFig = get(hFDA, 'FigureHandle');
    % 11 12
    set(hFig, 'units', 'pix');
    figPos = get(hFig, 'pos');
    figCtr = horzcat(plus(figPos(1.0), mrdivide(figPos(3.0), 2.0)), plus(figPos(2.0), mrdivide(figPos(4.0), 2.0)));
    % 15 16
    set(hmsg, 'units', 'pix');
    msgPos = get(hmsg, 'position');
    msgCtr = horzcat(plus(msgPos(1.0), mrdivide(msgPos(3.0), 2.0)), plus(msgPos(2.0), mrdivide(msgPos(4.0), 2.0)));
    % 19 20
    movePos = minus(figCtr, msgCtr);
    % 21 22
    new_msgPos = msgPos;
    new_msgPos(1.0:2.0) = plus(msgPos(1.0:2.0), movePos);
    set(hmsg, 'Position', new_msgPos);
end % function
