function src = gen_simstruc_types(modelName, sharedLocation)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if strcmp(get_param(modelName, 'PurelyIntegerCode'), 'off')
        NO_FLOATS = 0.0;
    else
        NO_FLOATS = 1.0;
    end % if
    src = '';
    src = horzcat(src, sprintf('%s\n', ' '));
    % 17 19
    % 18 19
    src = horzcat(src, sprintf('%s\n', ' '));
    % 20 21
    src = horzcat(src, sprintf('%s\n', ' '));
    src = horzcat(src, sprintf('%s\n', ' '));
    if rtw_gen_shared_utils(modelName)
        src = horzcat(src, sprintf('%s\n', '/* '));
        src = horzcat(src, sprintf('%s\n', ' * This structure is used by model reference to  '));
        src = horzcat(src, sprintf('%s\n', ' * communicate timing information through the hierarchy. '));
        src = horzcat(src, sprintf('%s\n', ' */ '));
        src = horzcat(src, sprintf('%s\n', 'typedef struct _rtTimingBridge_tag rtTimingBridge; '));
        src = horzcat(src, sprintf('%s\n', ' '));
        src = horzcat(src, sprintf('%s\n', 'struct _rtTimingBridge_tag { '));
        src = horzcat(src, sprintf('%s\n', ' '));
        src = horzcat(src, sprintf('%s\n', '    uint32_T     nTasks; '));
        src = horzcat(src, sprintf('%s\n', ' '));
        src = horzcat(src, sprintf('%s\n', '    uint32_T**   clockTick; '));
        src = horzcat(src, sprintf('%s\n', '    uint32_T**   clockTickH; '));
        src = horzcat(src, sprintf('%s\n', ' '));
        src = horzcat(src, sprintf('%s\n', '    uint32_T*    taskCounter; '));
        src = horzcat(src, sprintf('%s\n', ' '));
        if not(NO_FLOATS)
            src = horzcat(src, sprintf('%s\n', '    real_T*       taskTime; '));
        end % if
        src = horzcat(src, sprintf('%s\n', ' '));
        src = horzcat(src, sprintf('%s\n', '    boolean_T**  rateTransition; '));
        src = horzcat(src, sprintf('%s\n', '     '));
        src = horzcat(src, sprintf('%s\n', '    boolean_T    *firstInitCond; '));
        src = horzcat(src, sprintf('%s\n', '}; '));
        src = horzcat(src, sprintf('%s\n', ' '));
    end % if
    src = horzcat(src, sprintf('%s\n', ' '));
    % 50 52
    % 51 52
    src = horzcat(src, sprintf('%s\n', '/* States of an enabled subsystem */ '));
    src = horzcat(src, sprintf('%s\n', 'typedef enum { '));
    src = horzcat(src, sprintf('%s\n', '    SUBSYS_DISABLED          = 0, '));
    src = horzcat(src, sprintf('%s\n', '    SUBSYS_ENABLED           = 2, '));
    src = horzcat(src, sprintf('%s\n', '    SUBSYS_BECOMING_DISABLED = 4, '));
    src = horzcat(src, sprintf('%s\n', '    SUBSYS_BECOMING_ENABLED  = 8, '));
    src = horzcat(src, sprintf('%s\n', '    SUBSYS_TRIGGERED         = 16 '));
    src = horzcat(src, sprintf('%s\n', '} CondStates; '));
    src = horzcat(src, sprintf('%s\n', ' '));
    src = horzcat(src, sprintf('%s\n', '/* Trigger directions: falling, either, and rising */ '));
    src = horzcat(src, sprintf('%s\n', 'typedef enum { '));
    src = horzcat(src, sprintf('%s\n', '    FALLING_ZERO_CROSSING = -1, '));
    src = horzcat(src, sprintf('%s\n', '    ANY_ZERO_CROSSING     = 0, '));
    src = horzcat(src, sprintf('%s\n', '    RISING_ZERO_CROSSING  = 1 '));
    src = horzcat(src, sprintf('%s\n', '} ZCDirection; '));
    src = horzcat(src, sprintf('%s\n', ' '));
    src = horzcat(src, sprintf('%s\n', '/* Previous state of a trigger signal */ '));
    src = horzcat(src, sprintf('%s\n', 'typedef enum { '));
    src = horzcat(src, sprintf('%s\n', '    NEG_ZCSIG             = -1, '));
    src = horzcat(src, sprintf('%s\n', '    ZERO_ZCSIG            = 0, '));
    src = horzcat(src, sprintf('%s\n', '    POS_ZCSIG             = 1, '));
    src = horzcat(src, sprintf('%s\n', '    ZERO_RISING_EV_ZCSIG  = 100, /* zero and had a rising event  */ '));
    src = horzcat(src, sprintf('%s\n', '    ZERO_FALLING_EV_ZCSIG = 101, /* zero and had a falling event */ '));
    src = horzcat(src, sprintf('%s\n', '    UNINITIALIZED_ZCSIG   = INT_MAX '));
    src = horzcat(src, sprintf('%s\n', '} ZCSigState; '));
    src = horzcat(src, sprintf('%s\n', ' '));
    src = horzcat(src, sprintf('%s\n', '/* Current state of a trigger signal */ '));
    src = horzcat(src, sprintf('%s\n', 'typedef enum { '));
    src = horzcat(src, sprintf('%s\n', '    FALLING_ZCEVENT = -1, '));
    src = horzcat(src, sprintf('%s\n', '    NO_ZCEVENT      = 0, '));
    src = horzcat(src, sprintf('%s\n', '    RISING_ZCEVENT  = 1 '));
    src = horzcat(src, sprintf('%s\n', '} ZCEventType; '));
    src = horzcat(src, sprintf('%s\n', ' '));
    src = horzcat(src, sprintf('%s\n', '/* Enumeration of built-in data types */ '));
    src = horzcat(src, sprintf('%s\n', 'typedef enum { '));
    src = horzcat(src, sprintf('%s\n', '    SS_DOUBLE  =  0,    /* real_T    */ '));
    src = horzcat(src, sprintf('%s\n', '    SS_SINGLE  =  1,    /* real32_T  */ '));
    src = horzcat(src, sprintf('%s\n', '    SS_INT8    =  2,    /* int8_T    */ '));
    src = horzcat(src, sprintf('%s\n', '    SS_UINT8   =  3,    /* uint8_T   */ '));
    src = horzcat(src, sprintf('%s\n', '    SS_INT16   =  4,    /* int16_T   */ '));
    src = horzcat(src, sprintf('%s\n', '    SS_UINT16  =  5,    /* uint16_T  */ '));
    src = horzcat(src, sprintf('%s\n', '    SS_INT32   =  6,    /* int32_T   */ '));
    src = horzcat(src, sprintf('%s\n', '    SS_UINT32  =  7,    /* uint32_T  */ '));
    src = horzcat(src, sprintf('%s\n', '    SS_BOOLEAN =  8     /* boolean_T */ '));
    src = horzcat(src, sprintf('%s\n', '} BuiltInDTypeId; '));
    src = horzcat(src, sprintf('%s\n', ' '));
    src = horzcat(src, sprintf('%s\n', '#define SS_NUM_BUILT_IN_DTYPE ((int_T)SS_BOOLEAN+1) '));
    src = horzcat(src, sprintf('%s\n', ' '));
    src = horzcat(src, sprintf('%s\n', '   typedef int_T DTypeId; '));
    src = horzcat(src, sprintf('%s\n', ' '));
    src = horzcat(src, sprintf('%s\n', ' '));
    src = horzcat(src, sprintf('%s\n', ' '));
end % function
