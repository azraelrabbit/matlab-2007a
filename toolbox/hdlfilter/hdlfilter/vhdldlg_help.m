function y = vhdldlg_help
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    y.tag_mapping = @tag_mapping;
function tag = tag_mapping(hFig, tag)
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    [tag, tbx] = strtok(tag, filesep);
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    switch tag
    case 'hdlgui_language_serialpartitionstr'
        hc = findobj(hFig, 'Tag', 'architectures');
        if eq(get(hc, 'value'), 5.0)
            tag = 'hdlguioptions_LUT_Partition';
        else
            tag = 'hdlgui_language_serial_partition';
        end % if
    case 'hdlgui_language_daradixstr'
        tag = 'hdloptions_DARadix';
    end % switch
    % 32 35
    % 33 35
    tag = horzcat(tag, tbx);
