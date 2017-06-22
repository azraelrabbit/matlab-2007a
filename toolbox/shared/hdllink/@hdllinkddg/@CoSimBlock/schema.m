%  parentPkg = findpackage('Simulink');
%  parent  = findclass(parentPkg, 'SLDialogSource');
%  package = findpackage('hdllinkddg');
%  this = schema.class(package, 'CoSimBlock', parent);
%  
%  %%%%%%%%%%%
%  % METHODS %
%  %%%%%%%%%%%
%  % getSchemaDialog public method
%  m = schema.method(this, 'getDialogSchema');
%  s = m.Signature;
%  s.varargin    = 'off';
%  s.InputTypes  = {'handle', 'string'};
%  s.OutputTypes = {'mxArray'};
%  
%  m = schema.method(this, 'handleListSelection');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','string','mxArray'};
%  
%  % port functions
%  m = schema.method(this, 'twiddlePortTimeEdit');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','handle'};
%  
%  m = schema.method(this, 'addPortRow');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','handle'};
%  
%  m = schema.method(this, 'deletePortRow');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','handle'};
%  
%  m = schema.method(this, 'movePortRow');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','string','handle'};
%  
%  m = schema.method(this, 'autoPopulate');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','handle'};
%  
%  m = schema.method(this, 'changePortRow');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','handle'};
%  
%  m = schema.method(this, 'getPortTitle');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','string'};
%  m.Signature.OutputTypes = {'string'};
%  
%  % clock functions
%  %m = schema.method(this, 'twiddleClockTimeEdit');
%  %m.Signature.varargin   = 'off';
%  %m.Signature.InputTypes = {'handle','handle'};
%  m = schema.method(this, 'addClockRow');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','handle'};
%  
%  m = schema.method(this, 'deleteClockRow');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','handle'};
%  
%  m = schema.method(this, 'moveClockRow');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','string','handle'};
%  
%  m = schema.method(this, 'changeClockRow');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','handle'};
%  
%  m = schema.method(this, 'getClockTitle');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','string'};
%  m.Signature.OutputTypes = {'string'};
%  
%  % general
%  m = schema.method(this, 'preApply');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','handle'};
%  m.Signature.OutputTypes = {'bool','string'};
%  
%  %%%%%%%%%
%  % PROPS %
%  %%%%%%%%%
%  % infrastructure
%  schema.prop(this, 'Block',        'handle');
%  schema.prop(this, 'CurrentTab',   'int');
%  schema.prop(this, 'DisableList',  'bool');
%  schema.prop(this, 'Root',         'Simulink.BlockDiagram');
%  
%  % Ports tab
%  schema.prop(this, 'NumPortRows',     'int');
%  schema.prop(this, 'CurPortRow',      'int');
%  schema.prop(this, 'PortPaths',       'string');
%  schema.prop(this, 'PortModes',       'string');
%  schema.prop(this, 'PortTimes',       'string');
%  schema.prop(this, 'PortSigns',       'string');
%  schema.prop(this, 'PortFracLengths', 'string');
%  
%  schema.prop(this, 'PortPathEdit', 'string');
%  schema.prop(this, 'PortModeEdit', 'CoSimPortTypeEnum');
%  schema.prop(this, 'PortTimeEdit', 'string');
%  schema.prop(this, 'PortSignEdit', 'CoSimDataTypeEnum');
%  schema.prop(this, 'PortFracEdit', 'string');
%  
%  schema.prop(this, 'idxCellArray', 'string');
%  
%  % Comm tab
%  schema.prop(this, 'CommLocal',         'bool');
%  schema.prop(this, 'CommHostName',      'string');
%  schema.prop(this, 'CommSharedMemory',  'CoSimConnectionMethodEnum');
%  schema.prop(this, 'CommPortNumber',    'string');
%  schema.prop(this, 'CommShowInfo',      'bool');
%  schema.prop(this, 'CommLocalHostName', 'string');
%  
%  schema.prop(this, 'CosimBypass', 'CosimBypassEnum');
%  
%  % Clocks tab
%  schema.prop(this, 'NumClockRows', 'int');
%  schema.prop(this, 'CurClockRow',  'int');
%  schema.prop(this, 'ClockPaths',   'string');
%  schema.prop(this, 'ClockModes',   'string');
%  schema.prop(this, 'ClockTimes',   'string');
%  
%  schema.prop(this, 'ClockPathEdit', 'string');
%  schema.prop(this, 'ClockModeEdit', 'CoSimClockTypeEnum');
%  schema.prop(this, 'ClockTimeEdit', 'string');
%  
%  % Tcl tab
%  schema.prop(this, 'TclPreSimCommand',  'string');
%  schema.prop(this, 'TclPostSimCommand', 'string');
%  
%  % Timing tab
%  schema.prop(this, 'TimingScaleFactor', 'string');
%  schema.prop(this, 'TimingMode',        'CoSimTimingModeEnum');
parentPkg = findpackage('Simulink');
parent  = findclass(parentPkg, 'SLDialogSource');
package = findpackage('hdllinkddg');
this = schema.class(package, 'CoSimBlock', parent);

%%%%%%%%%%%
% METHODS %
%%%%%%%%%%%
% getSchemaDialog public method
m = schema.method(this, 'getDialogSchema');
s = m.Signature;
s.varargin    = 'off';
s.InputTypes  = {'handle', 'string'};
s.OutputTypes = {'mxArray'};

m = schema.method(this, 'handleListSelection');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','string','mxArray'};

% port functions
m = schema.method(this, 'twiddlePortTimeEdit');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','handle'};

m = schema.method(this, 'addPortRow');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','handle'};

m = schema.method(this, 'deletePortRow');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','handle'};

m = schema.method(this, 'movePortRow');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','string','handle'};

m = schema.method(this, 'autoPopulate');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','handle'};

m = schema.method(this, 'changePortRow');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','handle'};

m = schema.method(this, 'getPortTitle');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','string'};
m.Signature.OutputTypes = {'string'};

% clock functions
%m = schema.method(this, 'twiddleClockTimeEdit');
%m.Signature.varargin   = 'off';
%m.Signature.InputTypes = {'handle','handle'};
m = schema.method(this, 'addClockRow');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','handle'};

m = schema.method(this, 'deleteClockRow');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','handle'};

m = schema.method(this, 'moveClockRow');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','string','handle'};

m = schema.method(this, 'changeClockRow');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','handle'};

m = schema.method(this, 'getClockTitle');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','string'};
m.Signature.OutputTypes = {'string'};

% general
m = schema.method(this, 'preApply');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','handle'};
m.Signature.OutputTypes = {'bool','string'};

%%%%%%%%%
% PROPS %
%%%%%%%%%
% infrastructure
schema.prop(this, 'Block',        'handle');
schema.prop(this, 'CurrentTab',   'int');
schema.prop(this, 'DisableList',  'bool');
schema.prop(this, 'Root',         'Simulink.BlockDiagram');

% Ports tab
schema.prop(this, 'NumPortRows',     'int');
schema.prop(this, 'CurPortRow',      'int');
schema.prop(this, 'PortPaths',       'string');
schema.prop(this, 'PortModes',       'string');
schema.prop(this, 'PortTimes',       'string');
schema.prop(this, 'PortSigns',       'string');
schema.prop(this, 'PortFracLengths', 'string');

schema.prop(this, 'PortPathEdit', 'string');
schema.prop(this, 'PortModeEdit', 'CoSimPortTypeEnum');
schema.prop(this, 'PortTimeEdit', 'string');
schema.prop(this, 'PortSignEdit', 'CoSimDataTypeEnum');
schema.prop(this, 'PortFracEdit', 'string');

schema.prop(this, 'idxCellArray', 'string');

% Comm tab
schema.prop(this, 'CommLocal',         'bool');
schema.prop(this, 'CommHostName',      'string');
schema.prop(this, 'CommSharedMemory',  'CoSimConnectionMethodEnum');
schema.prop(this, 'CommPortNumber',    'string');
schema.prop(this, 'CommShowInfo',      'bool');
schema.prop(this, 'CommLocalHostName', 'string');

schema.prop(this, 'CosimBypass', 'CosimBypassEnum');

% Clocks tab
schema.prop(this, 'NumClockRows', 'int');
schema.prop(this, 'CurClockRow',  'int');
schema.prop(this, 'ClockPaths',   'string');
schema.prop(this, 'ClockModes',   'string');
schema.prop(this, 'ClockTimes',   'string');

schema.prop(this, 'ClockPathEdit', 'string');
schema.prop(this, 'ClockModeEdit', 'CoSimClockTypeEnum');
schema.prop(this, 'ClockTimeEdit', 'string');

% Tcl tab
schema.prop(this, 'TclPreSimCommand',  'string');
schema.prop(this, 'TclPostSimCommand', 'string');

% Timing tab
schema.prop(this, 'TimingScaleFactor', 'string');
schema.prop(this, 'TimingMode',        'CoSimTimingModeEnum');
