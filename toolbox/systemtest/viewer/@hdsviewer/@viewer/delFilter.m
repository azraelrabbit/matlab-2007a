function delFilter(h, thisfilt)
    % 1 8
    % 2 8
    % 3 8
    import com.mathworks.toolbox.systemtest.viewer.*;
    % 5 8
    % 6 8
    if isjava(thisfilt)
        h.FilterCtrl.delfilter(handle(thisfilt.fuddFilterObj));
    else
        h.FilterCtrl.delfilter(thisfilt);
    end % if
