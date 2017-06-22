%  parentPkg = findpackage('Simulink');
%  parent  = findclass(parentPkg, 'SLDialogSource');
%  package = findpackage('hdllinkddg');
%  this = schema.class(package, 'ToVcdBlock', parent);
%  
%  %-------------------------------------------------------
%  % METHODS 
%  %-------------------------------------------------------
%  % getSchemaDialog public method
%  %
%  m = schema.method(this, 'getDialogSchema');
%  s = m.Signature;
%  s.varargin    = 'off';
%  s.InputTypes  = {'handle', 'string'};
%  s.OutputTypes = {'mxArray'};
%  
%  % preApply -- tied to 'PrepApplyMethod' member of dlgStruct
%  %
%  m = schema.method(this, 'preApply');
%  m.Signature.varargin   = 'off';
%  m.Signature.InputTypes = {'handle','handle'};
%  m.Signature.OutputTypes = {'bool','string'};
%  
%  %-------------------------------------------------------
%  % PROPS
%  %-------------------------------------------------------
%  % infrastructure
%  schema.prop(this, 'Block',        'handle');
%  schema.prop(this, 'DisableList',  'bool');
%  schema.prop(this, 'Root',         'Simulink.BlockDiagram');
%  
%  % filename and inports -- do we need as local variables?
%  schema.prop(this, 'FileName', 'string');
%  schema.prop(this, 'NumInport', 'string');
%  
%  % timing tab -- do we need as local variables?
%  schema.prop(this, 'TimingScaleFactor', 'string');
%  schema.prop(this, 'TimingMode',        'CoSimTimingModeEnum');
%  schema.prop(this, 'HdlTickScale',      'ToVcdHdlScaleEnum');
%  schema.prop(this, 'HdlTickMode',       'ToVcdHdlTickModeEnum');
parentPkg = findpackage('Simulink');
parent  = findclass(parentPkg, 'SLDialogSource');
package = findpackage('hdllinkddg');
this = schema.class(package, 'ToVcdBlock', parent);

%-------------------------------------------------------
% METHODS 
%-------------------------------------------------------
% getSchemaDialog public method
%
m = schema.method(this, 'getDialogSchema');
s = m.Signature;
s.varargin    = 'off';
s.InputTypes  = {'handle', 'string'};
s.OutputTypes = {'mxArray'};

% preApply -- tied to 'PrepApplyMethod' member of dlgStruct
%
m = schema.method(this, 'preApply');
m.Signature.varargin   = 'off';
m.Signature.InputTypes = {'handle','handle'};
m.Signature.OutputTypes = {'bool','string'};

%-------------------------------------------------------
% PROPS
%-------------------------------------------------------
% infrastructure
schema.prop(this, 'Block',        'handle');
schema.prop(this, 'DisableList',  'bool');
schema.prop(this, 'Root',         'Simulink.BlockDiagram');

% filename and inports -- do we need as local variables?
schema.prop(this, 'FileName', 'string');
schema.prop(this, 'NumInport', 'string');

% timing tab -- do we need as local variables?
schema.prop(this, 'TimingScaleFactor', 'string');
schema.prop(this, 'TimingMode',        'CoSimTimingModeEnum');
schema.prop(this, 'HdlTickScale',      'ToVcdHdlScaleEnum');
schema.prop(this, 'HdlTickMode',       'ToVcdHdlTickModeEnum');
