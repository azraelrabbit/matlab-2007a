function createfixptmodeenums
    % 1 120
    % 2 120
    % 3 120
    % 4 120
    % 5 120
    % 6 120
    % 7 120
    % 8 120
    % 9 120
    % 10 120
    % 11 120
    % 12 120
    % 13 120
    % 14 120
    % 15 120
    % 16 120
    % 17 120
    % 18 120
    % 19 120
    % 20 120
    % 21 120
    % 22 120
    % 23 120
    % 24 120
    % 25 120
    % 26 120
    % 27 120
    % 28 120
    % 29 120
    % 30 120
    % 31 120
    % 32 120
    % 33 120
    % 34 120
    % 35 120
    % 36 120
    % 37 120
    % 38 120
    % 39 120
    % 40 120
    % 41 120
    % 42 120
    % 43 120
    % 44 120
    % 45 120
    % 46 120
    % 47 120
    % 48 120
    % 49 120
    % 50 120
    % 51 120
    % 52 120
    % 53 120
    % 54 120
    % 55 120
    % 56 120
    % 57 120
    % 58 120
    % 59 120
    % 60 120
    % 61 120
    % 62 120
    % 63 120
    % 64 120
    % 65 120
    % 66 120
    % 67 120
    % 68 120
    % 69 120
    % 70 120
    % 71 120
    % 72 120
    % 73 120
    % 74 120
    % 75 120
    % 76 120
    % 77 120
    % 78 120
    % 79 120
    % 80 120
    % 81 120
    % 82 120
    % 83 120
    % 84 120
    % 85 120
    % 86 120
    % 87 120
    % 88 120
    % 89 120
    % 90 120
    % 91 120
    % 92 120
    % 93 120
    % 94 120
    % 95 120
    % 96 120
    % 97 120
    % 98 120
    % 99 120
    % 100 120
    % 101 120
    % 102 120
    % 103 120
    % 104 120
    % 105 120
    % 106 120
    % 107 120
    % 108 120
    % 109 120
    % 110 120
    % 111 120
    % 112 120
    % 113 120
    % 114 120
    % 115 120
    % 116 120
    % 117 120
    % 118 120
    if isempty(findtype('SEARoundingModeEnum'))
        schema.EnumType('SEARoundingModeEnum', {'floor','nearest'});
    end % if
    % 122 124
    if isempty(findtype('SEAOverflowModeEnum'))
        schema.EnumType('SEAOverflowModeEnum', {'wrap','saturate'});
    end % if
    % 126 128
    if isempty(findtype('SEAComplexityEnum'))
        schema.EnumType('SEAComplexityEnum', {'Real','Complex'});
    end % if
    % 130 132
    ScaledTypeString = sealib.getspecifystring('scaled');
    UnscaledTypeString = sealib.getspecifystring('unscaled');
    EitherTypeString = sealib.getspecifystring('either');
    % 134 137
    % 135 137
    if isempty(findtype('SEAFixptModeBasicEnum'))
        schema.EnumType('SEAFixptModeBasicEnum', cellhorzcat('Same as input', ScaledTypeString));
        % 138 141
        % 139 141
    end % if
    % 141 144
    % 142 144
    if isempty(findtype('SEAFixptModeInheritEnum'))
        schema.EnumType('SEAFixptModeInheritEnum', cellhorzcat('Inherit via internal rule', 'Same as input', ScaledTypeString));
        % 145 149
        % 146 149
        % 147 149
    end % if
    % 149 152
    % 150 152
    if isempty(findtype('SEAFixptModeProdEnum'))
        schema.EnumType('SEAFixptModeProdEnum', cellhorzcat('Same as product', 'Same as input', ScaledTypeString));
        % 153 157
        % 154 157
        % 155 157
    end % if
    % 157 160
    % 158 160
    if isempty(findtype('SEAFixptModeInheritProdEnum'))
        schema.EnumType('SEAFixptModeInheritProdEnum', cellhorzcat('Inherit via internal rule', 'Same as product', 'Same as input', ScaledTypeString));
        % 161 166
        % 162 166
        % 163 166
        % 164 166
    end % if
    % 166 169
    % 167 169
    if isempty(findtype('SEAFixptModeAccumEnum'))
        schema.EnumType('SEAFixptModeAccumEnum', cellhorzcat('Same as accumulator', 'Same as input', ScaledTypeString));
        % 170 174
        % 171 174
        % 172 174
    end % if
    % 174 177
    % 175 177
    if isempty(findtype('SEAFixptModeAccumProdEnum'))
        schema.EnumType('SEAFixptModeAccumProdEnum', cellhorzcat('Same as accumulator', 'Same as product', 'Same as input', ScaledTypeString));
        % 178 183
        % 179 183
        % 180 183
        % 181 183
    end % if
    % 183 190
    % 184 190
    % 185 190
    % 186 190
    % 187 190
    % 188 190
    if isempty(findtype('SEAFixptModeBasicFirstEnum'))
        schema.EnumType('SEAFixptModeBasicFirstEnum', cellhorzcat('Same as first input', ScaledTypeString));
        % 191 194
        % 192 194
    end % if
    % 194 197
    % 195 197
    if isempty(findtype('SEAFixptModeInheritFirstEnum'))
        schema.EnumType('SEAFixptModeInheritFirstEnum', cellhorzcat('Inherit via internal rule', 'Same as first input', ScaledTypeString));
        % 198 202
        % 199 202
        % 200 202
    end % if
    % 202 205
    % 203 205
    if isempty(findtype('SEAFixptModeProdFirstEnum'))
        schema.EnumType('SEAFixptModeProdFirstEnum', cellhorzcat('Same as product', 'Same as first input', ScaledTypeString));
        % 206 210
        % 207 210
        % 208 210
    end % if
    % 210 213
    % 211 213
    if isempty(findtype('SEAFixptModeInheritProdFirstEnum'))
        schema.EnumType('SEAFixptModeInheritProdFirstEnum', cellhorzcat('Inherit via internal rule', 'Same as product', 'Same as first input', ScaledTypeString));
        % 214 219
        % 215 219
        % 216 219
        % 217 219
    end % if
    % 219 222
    % 220 222
    if isempty(findtype('SEAFixptModeAccumFirstEnum'))
        schema.EnumType('SEAFixptModeAccumFirstEnum', cellhorzcat('Same as accumulator', 'Same as first input', ScaledTypeString));
        % 223 227
        % 224 227
        % 225 227
    end % if
    % 227 230
    % 228 230
    if isempty(findtype('SEAFixptModeAccumProdFirstEnum'))
        schema.EnumType('SEAFixptModeAccumProdFirstEnum', cellhorzcat('Same as accumulator', 'Same as product', 'Same as first input', ScaledTypeString));
        % 231 236
        % 232 236
        % 233 236
        % 234 236
    end % if
    % 236 242
    % 237 242
    % 238 242
    % 239 242
    % 240 242
    if isempty(findtype('SEAFixptModeUnscaledEnum'))
        schema.EnumType('SEAFixptModeUnscaledEnum', cellhorzcat('Same word length as input', UnscaledTypeString));
        % 243 246
        % 244 246
    end % if
    % 246 248
    if isempty(findtype('SEAFixptModeEitherScaleEnum'))
        schema.EnumType('SEAFixptModeEitherScaleEnum', cellhorzcat('Same word length as input', EitherTypeString));
        % 249 252
        % 250 252
    end % if
    % 252 254
    if isempty(findtype('SEAFixptModeUnscaledFirstEnum'))
        schema.EnumType('SEAFixptModeUnscaledFirstEnum', cellhorzcat('Same word length as first input', UnscaledTypeString));
        % 255 258
        % 256 258
    end % if
    % 258 260
    if isempty(findtype('SEAFixptModeEitherScaleFirstEnum'))
        schema.EnumType('SEAFixptModeEitherScaleFirstEnum', cellhorzcat('Same word length as first input', EitherTypeString));
        % 261 264
        % 262 264
    end % if
    % 264 270
    % 265 270
    % 266 270
    % 267 270
    % 268 270
    if isempty(findtype('SEAFixptModeAccumNoInputEnum'))
        schema.EnumType('SEAFixptModeAccumNoInputEnum', cellhorzcat('Same as accumulator', ScaledTypeString));
        % 271 274
        % 272 274
    end % if
    % 274 276
    if isempty(findtype('SEAFixptModeAccumProdNoInputEnum'))
        schema.EnumType('SEAFixptModeAccumProdNoInputEnum', cellhorzcat('Same as accumulator', 'Same as product', ScaledTypeString));
        % 277 281
        % 278 281
        % 279 281
    end % if
    % 281 283
    if isempty(findtype('SEAFixptModeProdNoInputEnum'))
        schema.EnumType('SEAFixptModeProdNoInputEnum', cellhorzcat('Same as product', ScaledTypeString));
        % 284 287
        % 285 287
    end % if
    % 287 293
    % 288 293
    % 289 293
    % 290 293
    % 291 293
    if isempty(findtype('SEAFixptModeScaledOnlyEnum'))
        schema.EnumType('SEAFixptModeScaledOnlyEnum', cellhorzcat(ScaledTypeString));
    end % if
    % 295 297
    if isempty(findtype('SEAFixptModeUnscaledOnlyEnum'))
        schema.EnumType('SEAFixptModeUnscaledOnlyEnum', cellhorzcat(UnscaledTypeString));
    end % if
    % 299 301
    if isempty(findtype('SEAFixptModeScaledOrUnscaledOnlyEnum'))
        schema.EnumType('SEAFixptModeScaledOrUnscaledOnlyEnum', cellhorzcat(EitherTypeString));
    end % if
    % 303 309
    % 304 309
    % 305 309
    % 306 309
    % 307 309
    if isempty(findtype('SEAFixptModeOutputEnum'))
        schema.EnumType('SEAFixptModeOutputEnum', cellhorzcat('Same as output', ScaledTypeString));
        % 310 313
        % 311 313
    end % if
