function psbcbmachdemux(object)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if (strcmp(bdroot, 'powerlib')) | (strcmp(bdroot, 'powerlib2'))
        return
    end
    type = get_param(object, 'machType');
    CheckedMeasurements = ctranspose(strcmp(get_param(object, 'MaskValues'), 'on'));
    CurrentOutputs = getCurrentOutputs(object);
    switch type
    case 'Simplified synchronous'
        % 16 18
        Simplified = 'on,on,on,on,on,on,';
        Synchronous = 'off,off,off,off,off,off,off,off,off,off,off,off,off,off,off,';
        Asynchronous = 'off,off,off,off,off,off,off,off,off,off,off,';
        PermanentMag = 'off,off,off,off,off,off,off,';
        % 21 23
        tag = 'SSM';
        names = {'is_abc','vs_abc','e_abc','thetam','wm','Pe'};
        demuxString = '[3 3 3 1 1 1  , 1 1 1 1 1 1 1 1 1 1]';
        paddingString = '[0 0 0 0 0 0 0 0 0 0]';
        updateMask(object, tag, names, demuxString, CurrentOutputs(1.0:6.0), CheckedMeasurements(2.0:7.0), paddingString)
    case 'Synchronous'
        % 28 31
        % 29 31
        Simplified = 'off,off,off,off,off,off,';
        Synchronous = 'on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,';
        Asynchronous = 'off,off,off,off,off,off,off,off,off,off,off,';
        PermanentMag = 'off,off,off,off,off,off,off,';
        % 34 36
        tag = 'SM';
        names = {'is_abc','is_qd','ifd','ik_qd','phim_qd','vs_qd','d_theta','wm','Pe','dw','theta','Te','Delta','Peo','Qeo'};
        demuxString = '[3 2 1 3 2 2 1 1 1 1 1 1 1 1 1,  1]';
        paddingString = '0';
        updateMask(object, tag, names, demuxString, CurrentOutputs(1.0:15.0), CheckedMeasurements(8.0:22.0), paddingString)
    case 'Asynchronous'
        % 41 44
        % 42 44
        Simplified = 'off,off,off,off,off,off,';
        Synchronous = 'off,off,off,off,off,off,off,off,off,off,off,off,off,off,off,';
        Asynchronous = 'on,on,on,on,on,on,on,on,on,on,on,';
        PermanentMag = 'off,off,off,off,off,off,off,';
        % 47 49
        tag = 'ASM';
        names = {'ir_abc','ir_qd','phir_qd','vr_qd','is_abc','is_qd','phis_qd','vs_qd','wm','Te','thetam'};
        demuxString = '[3 2 2 2 3 2 2 2 1 1 1  , 1 1 1 1 1]';
        paddingString = '[0 0 0 0 0]';
        updateMask(object, tag, names, demuxString, CurrentOutputs(1.0:11.0), CheckedMeasurements(23.0:33.0), paddingString)
    case 'Permanent magnet synchronous'
        % 54 57
        % 55 57
        Simplified = 'off,off,off,off,off,off,';
        Synchronous = 'off,off,off,off,off,off,off,off,off,off,off,off,off,off,off,';
        Asynchronous = 'off,off,off,off,off,off,off,off,off,off,off,';
        PermanentMag = 'on,on,on,on,on,on,on,';
        % 60 62
        tag = 'PMSM';
        names = {'is_abc','is_qd','vs_qd','Hall effect','wm','thetam','Te'};
        demuxString = '[3 2 2 3 1 1 1 , 1 1 1 1 1 1 1 1 1]';
        paddingString = '[0 0 0 0 0 0 0 0 0]';
        updateMask(object, tag, names, demuxString, CurrentOutputs(1.0:7.0), CheckedMeasurements(34.0:40.0), paddingString)
    otherwise
        % 67 69
        error('Unknown machine type')
    end
    % 70 72
    MaskVisible = horzcat('on,', Simplified, Synchronous, Asynchronous, PermanentMag, 'off');
    set_param(object, 'MaskVisibilityString', MaskVisible)
end
function updateMask(object, tag, names, demuxString, CurrentOutputs, CheckedMeasurements, paddingString)
    % 75 78
    % 76 78
    qtyPorts = length(names);
    % 78 81
    % 79 81
    for k=1.0:15.0
        tagName = horzcat('port', num2str(k));
        h = find_system(object, 'FindAll', 'on', 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'tag', tagName);
        oldNames{k} = get_param(h, 'Name');
    end % for
    % 85 88
    % 86 88
    for k=plus(qtyPorts, 1.0):15.0
        oldName = horzcat(object, '/', oldNames{k});
        replace_block(oldName, 'FollowLinks', 'on', 'Terminator', 'noprompt');
        set_param(oldName, 'tag', horzcat('port', num2str(k)));
        newStatus(k) = 0.0;
    end % for
    % 93 96
    % 94 96
    for k=1.0:15.0
        newName = horzcat(tag, num2str(k));
        set_param(horzcat(object, '/', oldNames{k}), 'Name', newName);
        set_param(horzcat(object, '/', newName), 'tag', horzcat('port', num2str(k)));
        oldNames{k} = newName;
    end % for
    % 101 104
    % 102 104
    for k=1.0:qtyPorts
        newName = names{k};
        set_param(horzcat(object, '/', oldNames{k}), 'Name', newName);
        oldNames{k} = newName;
        newStatus(k) = CheckedMeasurements(k);
    end % for
    % 109 112
    % 110 112
    ToBeUpdated = find(xor(CurrentOutputs, CheckedMeasurements));
    for k=1.0:length(ToBeUpdated)
        tagName = horzcat('port', num2str(ToBeUpdated(k)));
        oldBlock = horzcat(object, '/', oldNames{ToBeUpdated(k)});
        if eq(CurrentOutputs(ToBeUpdated(k)), 1.0)
            replace_block(oldBlock, 'FollowLinks', 'on', 'Terminator', 'noprompt');
            set_param(oldBlock, 'tag', tagName);
        else
            replace_block(oldBlock, 'FollowLinks', 'on', 'Outport', 'noprompt');
            set_param(oldBlock, 'tag', tagName);
            portNumber = num2str(plus(length(find(newStatus(1.0:minus(ToBeUpdated(k), 1.0)))), 1.0));
            set_param(horzcat(object, '/', names{ToBeUpdated(k)}), 'Port', portNumber);
        end
    end % for
    % 125 127
    set_param(horzcat(object, '/lastStatus'), 'Value', horzcat('[ ', num2str(newStatus), ' ]'));
    set_param(horzcat(object, '/Demux'), 'Outputs', demuxString);
    set_param(horzcat(object, '/padding'), 'Value', paddingString);
end
function CurrentOutputs = getCurrentOutputs(object)
    % 131 138
    % 132 138
    % 133 138
    % 134 138
    % 135 138
    % 136 138
    for k=1.0:15.0
        tagName = horzcat('port', num2str(k));
        h = find_system(object, 'FindAll', 'on', 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'tag', tagName);
        CurrentOutputs(k) = strcmp(get_param(h, 'BlockType'), 'Outport');
    end % for
end
function SetMaskPrompts(object, units)
    % 144 147
    % 145 147
    switch units
    case 'pu'
        MaskPrompts = {'Machine type:';'Machine units:';'Line currents          [ isa  isb  isc ]';'Terminal voltages   [ va  vb  vc ]';'Internal voltages     [ ea  eb  ec ]';'Rotor angle            [ thetam ]   rad';'Rotor speed           [ wm ]';'Electrical power     [ Pe ]';'Stator currents                  [ isa  isb  isc ]';'Stator currents                  [ iq  id ]';'Field current                      [ ifd ]';'Damper winding currents   [ ikq1  ikq2  ikd ]';'Mutual fluxes                     [ phim_q   phim_d ]';'Stator voltages                  [ vs_q   vs_d ]';'Rotor angle deviation        [ d_theta ]   rad';'Rotor speed                       [ wm ]';'Electrical power                 [ Pe ]';'Rotor speed deviation       [ dw ]';'Rotor mechanical angle     [ theta ]   deg';'Electromagnetic torque     [ Te ]';'Load angle                         [ Delta ]   deg';'Output active power          [ Peo ]';'Output reactive power       [ Qeo ]';'Rotor currents    [ ira  irb  irc ]';'Rotor currents    [ ir_q   ir_d  ]';'Rotor fluxes       [ phir_q   phir_d ]';'Rotor voltages   [ vr_q   vr_d ]';'Stator currents   [ ia  ib  ic ]';'Stator currents   [ is_q   is_d ]';'Stator fluxes      [ phis_q  phis_d ]';'Stator voltages   [ vs_q  vs_d ]';'Rotor speed       [ wm ]';'Electromagnetic torque  [Te ]  pu';'Rotor angle        [ thetam ]  rad';'Stator currents   [ ia, ib, ic ]  A';'stator currents    [ is_q   is_d ]  A';'Stator voltages   [ vs_q   vs_d ]   V';'Hall effect       [ h_a  h_b  h_c ]';'Rotor speed       [ wm ]   rad/s';'Rotor angle        [ thetam ]  rad';'Electromagnetic torque  [Te ]  N.m';'lastType:'};
        % 150 193
        % 151 193
        % 152 193
        % 153 193
        % 154 193
        % 155 193
        % 156 193
        % 157 193
        % 158 193
        % 159 193
        % 160 193
        % 161 193
        % 162 193
        % 163 193
        % 164 193
        % 165 193
        % 166 193
        % 167 193
        % 168 193
        % 169 193
        % 170 193
        % 171 193
        % 172 193
        % 173 193
        % 174 193
        % 175 193
        % 176 193
        % 177 193
        % 178 193
        % 179 193
        % 180 193
        % 181 193
        % 182 193
        % 183 193
        % 184 193
        % 185 193
        % 186 193
        % 187 193
        % 188 193
        % 189 193
        % 190 193
        % 191 193
    case 'SI'
        % 192 194
        MaskPrompts = {'Machine type:';'Machine units:';'Line currents          [ isa  isb  isc ]  A';'Terminal voltages   [ va  vb  vc ]  V';'Internal voltages     [ ea  eb  ec ]  V';'Rotor angle            [ thetam ]   rad';'Rotor speed           [ wm ]  rad/s';'Electrical power     [ Pe ]  W';'Stator currents                  [ isa  isb  isc ]  A';'Stator currents                  [ iq  id ]  A';'Field current                      [ ifd ]  A';'Damper winding currents   [ ikq1  ikq2  ikd ]  A';'Mutual fluxes                     [ phim_q   phim_d ]';'Stator voltages                  [ vs_q   vs_d ]  V';'Rotor angle deviation        [ d_theta ]  rad';'Rotor speed                       [ wm ]  rad/s';'Electrical power                 [ Pe ]  W';'Rotor speed deviation       [ dw ]  pu';'Rotor mechanical angle     [ theta ]   deg';'Electromagnetic torque     [ Te ]  N.m';'Load angle                         [ Delta ]  deg';'Output active power          [ Peo ]  W';'Output reactive power       [ Qeo ]  Var';'Rotor currents    [ ira  irb  irc ]  A';'Rotor currents    [ ir_q   ir_d  ]   A';'Rotor fluxes       [ phir_q   phir_d ]  Wb';'Rotor voltages   [ vr_q   vr_d ]  V';'Stator currents   [ ia  ib  ic ]  A';'Stator currents   [ is_q   is_d ]  A';'Stator fluxes      [ phis_q  phis_d ]  Wb';'Stator voltages   [ vs_q  vs_d ]  V';'Rotor speed       [ wm ]  rad/s';'Electromagnetic torque  [Te ]  N.m';'Rotor angle        [ thetam ]  rad';'Stator currents   [ ia, ib, ic ]  A';'stator currents    [ is_q   is_d ]  A';'Stator voltages   [ vs_q   vs_d ]   V';'Hall effect       [ h_a  h_b  h_c ]';'Rotor speed       [ wm ]   rad/s';'Rotor angle        [ thetam ]  rad';'Electromagnetic torque  [Te ]  N.m';'lastType:'};
        % 194 238
        % 195 238
        % 196 238
        % 197 238
        % 198 238
        % 199 238
        % 200 238
        % 201 238
        % 202 238
        % 203 238
        % 204 238
        % 205 238
        % 206 238
        % 207 238
        % 208 238
        % 209 238
        % 210 238
        % 211 238
        % 212 238
        % 213 238
        % 214 238
        % 215 238
        % 216 238
        % 217 238
        % 218 238
        % 219 238
        % 220 238
        % 221 238
        % 222 238
        % 223 238
        % 224 238
        % 225 238
        % 226 238
        % 227 238
        % 228 238
        % 229 238
        % 230 238
        % 231 238
        % 232 238
        % 233 238
        % 234 238
        % 235 238
        % 236 238
    end
    set_param(object, 'MaskPrompts', MaskPrompts);
end
