function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('sigtools');
    c = schema.class(pk, 'sigfig');
    % 9 11
    p = vertcat(schema.prop(c, 'FigureHandle', 'double'), schema.prop(c, 'NotificationListener', 'handle.listener'), schema.prop(c, 'ObjectBeingDestroyedListener', 'handle.listener vector'), schema.prop(c, 'SigguiComponents', 'MATLAB array'));
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 17 19
    p = schema.prop(c, 'Handles', 'MATLAB array');
    p.Visible = 'Off';
    % 20 22
    p = schema.prop(c, 'AlphaMap', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'alphamap');
    p.GetFunction = cellhorzcat(@getproperty, 'alphamap');
    % 24 26
    p = schema.prop(c, 'BackingStore', 'on/off');
    p.SetFunction = cellhorzcat(@setproperty, 'backingstore');
    p.GetFunction = cellhorzcat(@getproperty, 'backingstore');
    % 28 30
    p = schema.prop(c, 'CloseRequestFcn', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'closerequestfcn');
    p.GetFunction = cellhorzcat(@getproperty, 'closerequestfcn');
    % 32 34
    p = schema.prop(c, 'Color', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'color');
    p.GetFunction = cellhorzcat(@getproperty, 'color');
    % 36 38
    p = schema.prop(c, 'ColorMap', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'colormap');
    p.GetFunction = cellhorzcat(@getproperty, 'colormap');
    % 40 42
    p = schema.prop(c, 'CurrentAxes', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'currentaxes');
    p.GetFunction = cellhorzcat(@getproperty, 'currentaxes');
    % 44 46
    p = schema.prop(c, 'CurrentCharacter', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'currentcharacter');
    p.GetFunction = cellhorzcat(@getproperty, 'currentcharacter');
    % 48 50
    p = schema.prop(c, 'CurrentObject', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'currentobject');
    p.GetFunction = cellhorzcat(@getproperty, 'currentobject');
    % 52 54
    p = schema.prop(c, 'CurrentPoint', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'currentpoint');
    p.GetFunction = cellhorzcat(@getproperty, 'currentpoint');
    % 56 58
    p = schema.prop(c, 'DitherMap', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'dithermap');
    p.GetFunction = cellhorzcat(@getproperty, 'dithermap');
    p.Visible = 'Off';
    % 61 63
    p = schema.prop(c, 'DitherMapMode', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'dithermapmode');
    p.GetFunction = cellhorzcat(@getproperty, 'dithermapmode');
    p.Visible = 'Off';
    % 66 68
    p = schema.prop(c, 'DockControls', 'on/off');
    p.SetFunction = cellhorzcat(@setproperty, 'dockcontrols');
    p.GetFunction = cellhorzcat(@getproperty, 'dockcontrols');
    % 70 72
    p = schema.prop(c, 'DoubleBuffer', 'on/off');
    p.SetFunction = cellhorzcat(@setproperty, 'doublebuffer');
    p.GetFunction = cellhorzcat(@getproperty, 'doublebuffer');
    % 74 76
    p = schema.prop(c, 'FileName', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'filename');
    p.GetFunction = cellhorzcat(@getproperty, 'filename');
    % 78 80
    p = schema.prop(c, 'FixedColors', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'fixedcolors');
    p.GetFunction = cellhorzcat(@getproperty, 'fixedcolors');
    % 82 84
    p = schema.prop(c, 'IntegerHandle', 'on/off');
    p.SetFunction = cellhorzcat(@setproperty, 'integerhandle');
    p.GetFunction = cellhorzcat(@getproperty, 'integerhandle');
    % 86 88
    p = schema.prop(c, 'InvertHardcopy', 'on/off');
    p.SetFunction = cellhorzcat(@setproperty, 'inverthardcopy');
    p.GetFunction = cellhorzcat(@getproperty, 'inverthardcopy');
    % 90 92
    p = schema.prop(c, 'KeyPressFcn', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'keypressfcn');
    p.GetFunction = cellhorzcat(@getproperty, 'keypressfcn');
    % 94 96
    p = schema.prop(c, 'MenuBar', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'menubar');
    p.GetFunction = cellhorzcat(@getproperty, 'menubar');
    % 98 100
    p = schema.prop(c, 'MinColormap', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'mincolormap');
    p.GetFunction = cellhorzcat(@getproperty, 'mincolormap');
    % 102 104
    p = schema.prop(c, 'Name', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'name');
    p.GetFunction = cellhorzcat(@getproperty, 'name');
    % 106 108
    p = schema.prop(c, 'NextPlot', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'nextplot');
    p.GetFunction = cellhorzcat(@getproperty, 'nextplot');
    % 110 112
    p = schema.prop(c, 'NumberTitle', 'on/off');
    p.SetFunction = cellhorzcat(@setproperty, 'numbertitle');
    p.GetFunction = cellhorzcat(@getproperty, 'numbertitle');
    % 114 116
    p = schema.prop(c, 'PaperUnits', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'paperunits');
    p.GetFunction = cellhorzcat(@getproperty, 'paperunits');
    % 118 120
    p = schema.prop(c, 'PaperOrientation', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'paperorientation');
    p.GetFunction = cellhorzcat(@getproperty, 'paperorientation');
    % 122 124
    p = schema.prop(c, 'PaperPosition', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'paperposition');
    p.GetFunction = cellhorzcat(@getproperty, 'paperposition');
    % 126 128
    p = schema.prop(c, 'PaperPositionMode', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'paperpositionmode');
    p.GetFunction = cellhorzcat(@getproperty, 'paperpositionmode');
    % 130 132
    p = schema.prop(c, 'PaperSize', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'papersize');
    p.GetFunction = cellhorzcat(@getproperty, 'papersize');
    % 134 136
    p = schema.prop(c, 'PaperType', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'papertype');
    p.GetFunction = cellhorzcat(@getproperty, 'papertype');
    % 138 140
    p = schema.prop(c, 'Pointer', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'pointer');
    p.GetFunction = cellhorzcat(@getproperty, 'pointer');
    % 142 144
    p = schema.prop(c, 'PointerShapeCData', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'pointershapecdata');
    p.GetFunction = cellhorzcat(@getproperty, 'pointershapecdata');
    % 146 148
    p = schema.prop(c, 'PointerShapeHotSpot', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'pointershapehotspot');
    p.GetFunction = cellhorzcat(@getproperty, 'pointershapehotspot');
    % 150 152
    p = schema.prop(c, 'Position', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'position');
    p.GetFunction = cellhorzcat(@getproperty, 'position');
    % 154 156
    p = schema.prop(c, 'Renderer', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'renderer');
    p.GetFunction = cellhorzcat(@getproperty, 'renderer');
    % 158 160
    p = schema.prop(c, 'RendererMode', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'renderermode');
    p.GetFunction = cellhorzcat(@getproperty, 'renderermode');
    % 162 164
    p = schema.prop(c, 'Resize', 'on/off');
    p.SetFunction = cellhorzcat(@setproperty, 'resize');
    p.GetFunction = cellhorzcat(@getproperty, 'resize');
    % 166 168
    p = schema.prop(c, 'ResizeFcn', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'resizefcn');
    p.GetFunction = cellhorzcat(@getproperty, 'resizefcn');
    % 170 172
    p = schema.prop(c, 'SelectionType', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'selectiontype');
    p.GetFunction = cellhorzcat(@getproperty, 'selectiontype');
    % 174 176
    p = schema.prop(c, 'ShareColors', 'on/off');
    p.SetFunction = cellhorzcat(@setproperty, 'sharecolors');
    p.GetFunction = cellhorzcat(@getproperty, 'sharecolors');
    % 178 180
    p = schema.prop(c, 'Toolbar', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'toolbar');
    p.GetFunction = cellhorzcat(@getproperty, 'toolbar');
    % 182 184
    p = schema.prop(c, 'Units', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'units');
    p.GetFunction = cellhorzcat(@getproperty, 'units');
    % 186 188
    p = schema.prop(c, 'WindowButtonDownFcn', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'windowbuttondownfcn');
    p.GetFunction = cellhorzcat(@getproperty, 'windowbuttondownfcn');
    % 190 192
    p = schema.prop(c, 'WindowButtonMotionFcn', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'windowbuttonmotionfcn');
    p.GetFunction = cellhorzcat(@getproperty, 'windowbuttonmotionfcn');
    % 194 196
    p = schema.prop(c, 'WindowButtonUpFcn', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'windowbuttonupfcn');
    p.GetFunction = cellhorzcat(@getproperty, 'windowbuttonupfcn');
    % 198 200
    p = schema.prop(c, 'WindowStyle', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'windowstyle');
    p.GetFunction = cellhorzcat(@getproperty, 'windowstyle');
    % 202 204
    p = schema.prop(c, 'BeingDeleted', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'beingdeleted');
    p.GetFunction = cellhorzcat(@getproperty, 'beingdeleted');
    % 206 208
    p = schema.prop(c, 'ButtonDownFcn', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'buttondownfcn');
    p.GetFunction = cellhorzcat(@getproperty, 'buttondownfcn');
    % 210 212
    p = schema.prop(c, 'Children', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'children');
    p.GetFunction = cellhorzcat(@getproperty, 'children');
    % 214 216
    p = schema.prop(c, 'Clipping', 'on/off');
    p.SetFunction = cellhorzcat(@setproperty, 'clipping');
    p.GetFunction = cellhorzcat(@getproperty, 'clipping');
    % 218 220
    p = schema.prop(c, 'CreateFcn', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'createfcn');
    p.GetFunction = cellhorzcat(@getproperty, 'createfcn');
    % 222 224
    p = schema.prop(c, 'DeleteFcn', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'deletefcn');
    p.GetFunction = cellhorzcat(@getproperty, 'deletefcn');
    % 226 228
    p = schema.prop(c, 'BusyAction', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'busyaction');
    p.GetFunction = cellhorzcat(@getproperty, 'busyaction');
    % 230 232
    p = schema.prop(c, 'HandleVisibility', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'handlevisibility');
    p.GetFunction = cellhorzcat(@getproperty, 'handlevisibility');
    % 234 236
    p = schema.prop(c, 'HitTest', 'on/off');
    p.SetFunction = cellhorzcat(@setproperty, 'hittest');
    p.GetFunction = cellhorzcat(@getproperty, 'hittest');
    % 238 240
    p = schema.prop(c, 'Interruptible', 'on/off');
    p.SetFunction = cellhorzcat(@setproperty, 'interruptible');
    p.GetFunction = cellhorzcat(@getproperty, 'interruptible');
    % 242 244
    p = schema.prop(c, 'Parent', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'parent');
    p.GetFunction = cellhorzcat(@getproperty, 'parent');
    % 246 248
    p = schema.prop(c, 'Selected', 'on/off');
    p.SetFunction = cellhorzcat(@setproperty, 'selected');
    p.GetFunction = cellhorzcat(@getproperty, 'selected');
    % 250 252
    p = schema.prop(c, 'SelectionHighlight', 'on/off');
    p.SetFunction = cellhorzcat(@setproperty, 'selectionhighlight');
    p.GetFunction = cellhorzcat(@getproperty, 'selectionhighlight');
    % 254 256
    p = schema.prop(c, 'Tag', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'tag');
    p.GetFunction = cellhorzcat(@getproperty, 'tag');
    % 258 260
    p = schema.prop(c, 'UIContextMenu', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'uicontextmenu');
    p.GetFunction = cellhorzcat(@getproperty, 'uicontextmenu');
    % 262 264
    p = schema.prop(c, 'UserData', 'mxArray');
    p.SetFunction = cellhorzcat(@setproperty, 'userdata');
    p.GetFunction = cellhorzcat(@getproperty, 'userdata');
    % 266 268
    p = schema.prop(c, 'Visible', 'on/off');
    p.SetFunction = cellhorzcat(@setproperty, 'visible');
    p.GetFunction = cellhorzcat(@getproperty, 'visible');
    % 270 272
    schema.event(c, 'Notification');
end % function
function prop = setproperty(this, prop, propname)
    % 274 277
    % 275 277
    setprop(this, propname, prop);
end % function
function prop = getproperty(this, prop, propname)
    % 279 282
    % 280 282
    prop = getprop(this, propname, prop);
end % function
