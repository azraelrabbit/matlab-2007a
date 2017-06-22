function h = ERTTargetCC(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if gt(nargin, 0.0)
        h = [];
        error('No constructor Simulink.ERTTargetCC with matching signature found.');
    end % if
    % 12 13
    h = Simulink.ERTTargetCC;
    set(h, 'IsERTTarget', 'on');
    set(h, 'ModelReferenceCompliant', 'on');
    set(h, 'CombineOutputUpdateFcns', 'on');
    set(h, 'ERTCustomFileBanners', 'on');
    set(h, 'GenerateSampleERTMain', 'on');
    set(h, 'MatFileLogging', 'off');
    set(h, 'SupportNonInlinedSFcns', 'off');
    set(h, 'SupportContinuousTime', 'off');
    set(h, 'ERTFirstTimeCompliant', 'on');
    set(h, 'ModelStepFunctionPrototypeControlCompliant', 'on');
    % 24 25
    registerPropList(h, 'NoDuplicate', 'All', []);
end % function
