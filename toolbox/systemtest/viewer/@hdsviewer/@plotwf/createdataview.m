function [data, view, dataprops] = createdataview(this)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    data = hdsviewer.wfdata;
    % 12 14
    % 13 14
    view = hdsviewer.wfview;
    view.AxesGrid = this.AxesGrid;
    % 16 18
    % 17 18
    dataprops = vertcat(data.findprop('XData'), data.findprop('YData'), data.findprop('ZData'));
end % function
