function setupIcon(this, block)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    block = get_param(block, 'Handle');
    position = get_param(block, 'Position');
    if any(this.Size)
        position(3.0:4.0) = plus(position(1.0:2.0), this.Size);
    end % if
    % 13 14
    set_param(block, 'Position', position, 'Mask', 'on', 'MaskDisplay', this.Display, 'ShowName', lOnOff(this.ShowName), 'MaskIconFrame', lOnOff(this.ShowFrame));
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
end % function
function v = lOnOff(vIn)
    % 23 25
    % 24 25
    v = 'off';
    if vIn
        v = 'on';
    end % if
end % function
