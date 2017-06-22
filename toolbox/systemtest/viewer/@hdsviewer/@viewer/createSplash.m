function createSplash(h)
    % 1 7
    % 2 7
    % 3 7
    import com.mathworks.toolbox.systemtest.viewer.*;
    % 5 7
    if not(isempty(h.Splash)) && ishandle(h.Splash)
        return;
    end % if
    h.Splash = figure('Visible', 'off', 'Color', [1.0 1.0 1.0], 'NumberTitle', 'off', 'IntegerHandle', 'off');
    % 10 12
    set(h.Splash, 'ResizeFcn', @resizeFigure, 'KeyPressFcn', @(es,ed)1);
    % 12 14
    delete(findobj(allchild(h.splash), 'type', 'uimenu'))
    tb = findall(h.splash, 'Type', 'uitoolbar');
    delete(allchild(tb));
    % 16 20
    % 17 20
    % 18 20
    ax1 = axes('Parent', h.Splash, 'Visible', 'off', 'Units', 'Pixels');
    setappdata(h.Splash, 'InitialAxes', ax1);
    % 21 24
    % 22 24
    [cdata, map] = imread('toolbar-buttons-text.gif');
    cdata = ind2rgb(cdata, map);
    im = image(cdata);
    set(im, 'Parent', ax1)
    set(ax1, 'visible', 'off')
    axis('image');
    setappdata(h.Splash, 'InitialText', im);
    % 30 32
    jf = get(h.Splash, 'javaFrame');
    drawnow
    jf.setDesktopGroup(com.mathworks.toolbox.systemtest.viewer.NDDesktop.getInstance, 'Plots');
    drawnow
    set(h.Splash, 'WindowStyle', 'docked')
    set(h.Splash, 'vis', 'on', 'HandleVisibility', 'callback')
function resizeFigure(src, eventdata)
    % 38 40
    f = src;
    im = getappdata(f, 'InitialText');
    ax = getappdata(f, 'InitialAxes');
    cdata = get(im, 'cdata');
    imsize = size(cdata);
    figurepos = get(f, 'Position');
    wd = imsize(2.0);
    ht = imsize(1.0);
    x = minus(mrdivide(figurepos(3.0), 2.0), mrdivide(wd, 2.0));
    y = minus(mrdivide(figurepos(4.0), 2.0), mrdivide(ht, 2.0));
    set(ax, 'Position', horzcat(x, y, wd, ht));
