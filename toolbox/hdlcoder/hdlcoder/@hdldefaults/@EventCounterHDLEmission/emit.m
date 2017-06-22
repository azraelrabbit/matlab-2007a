function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hdlcode = hdlcodeinit;
    % 7 9
    bfp = hC.SimulinkHandle;
    bdt = hdlgetparameter('base_data_type');
    name = hdllegalname(get_param(bfp, 'Name'));
    % 11 13
    comment = horzcat('\n', '  ', hdlgetparameter('comment_char'), 'Event Counter ', get_param(bfp, 'CountEvent'), ': ');
    body = '';
    signals = '';
    % 15 18
    % 16 18
    CounterSize = get_param(bfp, 'CounterSize');
    Output = get_param(bfp, 'Output');
    Direction = get_param(bfp, 'Direction');
    CountEvent = get_param(bfp, 'CountEvent');
    ProcessName = get_param(bfp, 'Name');
    InitialCount = str2num(get_param(bfp, 'InitialCount'));
    % 23 25
    hS = hC.OutputPorts(1.0).getSignal;
    context = this.beginClockBundleContext(hC.Owner, hC, hS, 1.0, 1.0, 0.0);
    % 26 30
    % 27 30
    % 28 30
    event = hC.InputPorts(1.0).getSignal;
    event_sltype = hdlsignalsltype(event);
    event_vtype = hdlblockdatatype(event_sltype);
    if not(strcmpi(CountEvent, 'Free running'))
        event_rst = hC.InputPort(2.0).getSignal;
    end % if
    % 35 38
    % 36 38
    if strcmpi(CounterSize, 'User defined')
        MaxCount = evalin('base', get_param(bfp, 'MaxCount'));
        counter_size = ceil(log2(MaxCount));
    else
        if strcmpi(CounterSize, '8 bits')
            counter_size = 8.0;
            MaxCount = mpower(2.0, counter_size);
        else
            if strcmpi(CounterSize, '16 bits')
                counter_size = 16.0;
                MaxCount = mpower(2.0, counter_size);
            else
                if strcmpi(CounterSize, '32 bits')
                    counter_size = 32.0;
                    MaxCount = mpower(2.0, counter_size);
                else
                    error(hdlcodererrormsgid('unsupportblock'), 'Unsupported Counter Size');
                end % if
            end % if
        end % if
    end % if
    if strcmpi(Output, 'Count and Hit')
        event_count = hC.OutputPort(1.0).getSignal;
        event_hit = hC.OutputPort(2.0).getSignal;
        HitValue = evalin('base', get_param(bfp, 'HitValue'));
    else
        if strcmpi(Output, 'Count')
            event_count = hC.OutputPort(1.0).getSignal;
            event_hit = 0.0;
            HitValue = -1.0;
        else
            if strcmpi(Output, 'Hit')
                event_count = hC.OutputPort(1.0).getSignal;
                HitValue = evalin('base', get_param(bfp, 'HitValue'));
                [cntvtype, cntsltype] = hdlgettypesfromsizes(counter_size, 0.0, 0.0);
                [idxname, event_count] = hdlnewsignal('event_count', 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
                signals = horzcat(signals, makehdlsignaldecl(event_count));
            else
                error(hdlcodererrormsgid('unsupportblock'), 'This block function mode (%s) for COunter is not supported');
            end % if
        end % if
    end % if
    if strcmpi(Direction, 'Up')
        Direction = 1.0;
    else
        Direction = 0.0;
    end % if
    if strcmpi(CountEvent, 'Free running')
        CountEvent = 'Free_running';
    else
        [name, cnt_enable] = hdlnewsignal('cnt_enable', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(cnt_enable));
        [name, event_std] = hdlnewsignal('event_std', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(event_std));
        body = horzcat(body, hdlgetparameter('comment_char'), '*******************************************************');
        body = horzcat(body, comment, 'Event detection.', '\n');
        body = horzcat(body, hdlgetparameter('comment_char'), '*******************************************************', '\n');
        if strcmpi(event_sltype, 'boolean')
            body = horzcat(body, hdlsignalassignment(event, event_std));
            [name, event_std_dly] = hdlnewsignal('event_std_dly', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            if not(strcmpi(CountEvent, 'Non-Zero Sample'))
                signals = horzcat(signals, makehdlsignaldecl(event_std_dly));
                body = horzcat(body, hdlunitdelay(event_std, event_std_dly, 'delay', 0.0));
            end % if
        else
            if strcmpi(CountEvent, 'Non-Zero Sample')
                zero = 0.0;
                [zerovtype, zerosltype] = hdlgettypesfromsizes(zero, 0.0, 0.0);
                [incsz, incbp, incsi] = hdlgetsizesfromtype(zerosltype);
                [idxname, ZERO] = hdlnewsignal('ZERO', 'block', -1.0, 0.0, 0.0, zerovtype, zerosltype);
                signals = horzcat(signals, makehdlconstantdecl(ZERO, hdlconstantvalue(1.0, incsz, incbp, incsi)));
                body = horzcat(body, hdlrelop(event, ZERO, event_std, '!='));
            else
                [name, event_dly] = hdlnewsignal('event_dly', 'block', -1.0, 0.0, 0.0, event_vtype, event_sltype);
                signals = horzcat(signals, makehdlsignaldecl(event_dly));
                [name, isIncreasing] = hdlnewsignal('isIncreasing', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                signals = horzcat(signals, makehdlsignaldecl(isIncreasing));
                [name, isEqual] = hdlnewsignal('isEqual', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                signals = horzcat(signals, makehdlsignaldecl(isEqual));
                [name, curState] = hdlnewsignal('curState', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                signals = horzcat(signals, makehdlsignaldecl(curState));
                [name, nxtState] = hdlnewsignal('nxtState', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                signals = horzcat(signals, makehdlsignaldecl(nxtState));
                body = horzcat(body, hdlunitdelay(event, event_dly, 'event_data_delay', 0.0));
                body = horzcat(body, hdlrelop(event, event_dly, isIncreasing, '>'));
                body = horzcat(body, hdlrelop(event, event_dly, isEqual, '='));
                body = horzcat(body, hdlmux(horzcat(curState, isIncreasing), nxtState, isEqual, {'=='}, [], 'when-else', [], [0.0 1.0]));
                body = horzcat(body, hdlunitdelay(nxtState, curState, 'stateRegister', 0.0));
            end % if
        end % if
        if strcmpi(CountEvent, 'Rising Edge')
            CountEvent = 'Rising_Edge';
            [name, not_curState] = hdlnewsignal('not_curState', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(not_curState));
            [name, curState] = hdlnewsignal('curState', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(curState));
            [name, nxtState] = hdlnewsignal('nxtState', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(nxtState));
            body = horzcat(body, hdlbitop(curState, not_curState, 'NOT'));
            body = horzcat(body, hdlbitop(horzcat(nxtState, not_curState), cnt_enable, 'AND'));
        else
            if strcmpi(CountEvent, 'Falling Edge')
                CountEvent = 'Falling_Edge';
                [name, not_nxtState] = hdlnewsignal('not_nxtState', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                signals = horzcat(signals, makehdlsignaldecl(not_nxtState));
                [name, curState] = hdlnewsignal('curState', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                signals = horzcat(signals, makehdlsignaldecl(curState));
                [name, nxtState] = hdlnewsignal('nxtState', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                signals = horzcat(signals, makehdlsignaldecl(nxtState));
                body = horzcat(body, hdlbitop(nxtState, not_nxtState, 'NOT'));
                body = horzcat(body, hdlbitop(horzcat(curState, not_nxtState), cnt_enable, 'AND'));
            else
                if strcmpi(CountEvent, 'Either Edge')
                    [name, not_curState] = hdlnewsignal('not_curState', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                    signals = horzcat(signals, makehdlsignaldecl(not_curState));
                    [name, curState] = hdlnewsignal('curState', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                    signals = horzcat(signals, makehdlsignaldecl(curState));
                    [name, nxtState] = hdlnewsignal('nxtState', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                    signals = horzcat(signals, makehdlsignaldecl(nxtState));
                    [name, risingEdge] = hdlnewsignal('risingEdge', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                    signals = horzcat(signals, makehdlsignaldecl(risingEdge));
                    body = horzcat(body, hdlbitop(curState, not_curState, 'NOT'));
                    body = horzcat(body, hdlbitop(horzcat(nxtState, not_curState), risingEdge, 'AND'));
                    [name, not_nxtState] = hdlnewsignal('not_nxtState', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                    signals = horzcat(signals, makehdlsignaldecl(not_nxtState));
                    [name, fallingEdge] = hdlnewsignal('fallingEdge', 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                    signals = horzcat(signals, makehdlsignaldecl(fallingEdge));
                    body = horzcat(body, hdlbitop(nxtState, not_nxtState, 'NOT'));
                    body = horzcat(body, hdlbitop(horzcat(curState, not_nxtState), fallingEdge, 'AND'));
                    body = horzcat(body, hdlbitop(horzcat(risingEdge, fallingEdge), cnt_enable, 'OR'));
                else
                    if strcmpi(CountEvent, 'Non-Zero Sample')
                        CountEvent = 'Non_Zero_Sample';
                        body = horzcat(body, hdlsignalassignment(event_std, cnt_enable));
                    else
                        error(hdlcodererrormsgid('unsupportblock'), 'Unsupported Count Event');
                    end % if
                end % if
                % 175 177
            end % if
        end % if
    end % if
    body = horzcat(body, hdlgetparameter('comment_char'), '*******************************************************');
    body = horzcat(body, comment, 'Event Counter.', '\n');
    body = horzcat(body, hdlgetparameter('comment_char'), '*******************************************************', '\n');
    old_clken = hdlgetcurrentclockenable;
    hdladdclockenablesignal(cnt_enable);
    hdlsetcurrentclockenable(cnt_enable);
    ProcessName = horzcat(ProcessName, '_', CountEvent);
    % 186 188
    [tmpbody, tmpsignals] = hdlcounter(event_count, plus(MaxCount, 1.0), ProcessName, Direction, InitialCount, -1.0, event_rst, 0.0, -1.0);
    hdlsetcurrentclockenable(old_clken);
    % 189 191
    signals = horzcat(signals, makehdlsignaldecl(tmpsignals));
    body = horzcat(body, tmpbody);
    % 192 195
    % 193 195
    if not(strcmpi(Output, 'Count'))
        if ge(HitValue, 0.0)
            % 196 198
            [incsz, incbp, incsi] = hdlgetsizesfromtype(hdlsignalsltype(event_count));
            [idxname, HIT] = hdlnewsignal('HITVALUE', 'block', -1.0, 0.0, 0.0, hdlsignalvtype(event_count), hdlsignalsltype(event_count));
            signals = horzcat(signals, makehdlconstantdecl(HIT, hdlconstantvalue(HitValue, incsz, incbp, incsi)));
            body = horzcat(body, hdlrelop(event_count, HIT, event_hit, ' = '));
        end % if
    end % if
    % 203 205
    this.endClockBundleContext(context);
    % 205 207
    hdlcode.arch_body_blocks = body;
    hdlcode.arch_signals = signals;
end % function
