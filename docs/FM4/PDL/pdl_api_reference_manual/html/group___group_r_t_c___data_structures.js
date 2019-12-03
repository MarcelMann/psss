var group___group_r_t_c___data_structures =
[
    [ "stc_rtc_freq_corr_t", "structstc__rtc__freq__corr__t.html", [
      [ "u16FreqCorrValue", "structstc__rtc__freq__corr__t.html#aabf751719b36009649c742500c74f819", null ]
    ] ],
    [ "stc_rtc_timer_t", "structstc__rtc__timer__t.html", [
      [ "enMode", "structstc__rtc__timer__t.html#acd39b9f73b64a5d6ce0766e7e83fea03", null ],
      [ "u32TimerCycle", "structstc__rtc__timer__t.html#aa5591ea91838946f57fdfb9b8ccd01f5", null ]
    ] ],
    [ "stc_rtc_irq_en_t", "structstc__rtc__irq__en__t.html", [
      [ "bHalfSecondIrq", "structstc__rtc__irq__en__t.html#a9cdfd8e1f7dc7fd3776e372d2a1c4870", null ],
      [ "bOneSecondIrq", "structstc__rtc__irq__en__t.html#abfbd70f967f6059342bf1548d4df1c0e", null ],
      [ "bOneMinuteIrq", "structstc__rtc__irq__en__t.html#a9550cc36cd1669c8aa494421ced48b31", null ],
      [ "bOneHourIrq", "structstc__rtc__irq__en__t.html#ad5d4b23338395f81e56c204a10d25e7f", null ],
      [ "bTimerIrq", "structstc__rtc__irq__en__t.html#a2408424135ec1155bc889f26c4651ce6", null ],
      [ "bAlarmIrq", "structstc__rtc__irq__en__t.html#aa7df42cfb99279b17689cd0465c1e6db", null ],
      [ "bTimeRewriteErrorIrq", "structstc__rtc__irq__en__t.html#ada7fe4e3ef0e8a69d20440be16299e2c", null ]
    ] ],
    [ "stc_rtc_irq_cb_t", "structstc__rtc__irq__cb__t.html", [
      [ "pfnTimeWrtErrIrqCb", "structstc__rtc__irq__cb__t.html#a5c09aa3784bc23015b04cf7209dc537c", null ],
      [ "pfnAlarmIrqCb", "structstc__rtc__irq__cb__t.html#a9c1b3ba8aa9356c0add806aab28d551b", null ],
      [ "pfnTimerIrqCb", "structstc__rtc__irq__cb__t.html#a2c7429db46f4454f2be58afa87363776", null ],
      [ "pfnHalfSecondIrqCb", "structstc__rtc__irq__cb__t.html#a98687b7805f4f7e35b7bed2fe392db83", null ],
      [ "pfnOneSecondIrqCb", "structstc__rtc__irq__cb__t.html#a9639c100ed2e2a4ce0c8da53d8171170", null ],
      [ "pfnOneMinuteIrqCb", "structstc__rtc__irq__cb__t.html#a8897da7e342fec599631657594f03230", null ],
      [ "pfnOneHourIrqCb", "structstc__rtc__irq__cb__t.html#a19b2c6b0a4e73b02d3d70c2882c90cc7", null ]
    ] ],
    [ "stc_rtc_time_t", "structstc__rtc__time__t.html", [
      [ "u8Second", "structstc__rtc__time__t.html#aab6c0669d1d5ddc914cd04af3820e7bc", null ],
      [ "u8Minute", "structstc__rtc__time__t.html#aaa78faacd60c1b5e5f861e0cccc95e67", null ],
      [ "u8Hour", "structstc__rtc__time__t.html#aaecc0cc9a1cea82470ab1b41220fd620", null ],
      [ "u8Day", "structstc__rtc__time__t.html#a562ac098cf9baf88d98deefacbbb55fe", null ],
      [ "u8DayOfWeek", "structstc__rtc__time__t.html#a58aec5b4cbcde387b723e8b9d27e4af9", null ],
      [ "u8Month", "structstc__rtc__time__t.html#a859935c0ae0e8cebc5133bdc0ab0eb22", null ],
      [ "u16Year", "structstc__rtc__time__t.html#adb6f10ba2673d281512f28aee93c8194", null ]
    ] ],
    [ "stc_rtc_alarm_t", "structstc__rtc__alarm__t.html", [
      [ "u8Minute", "structstc__rtc__alarm__t.html#a10bc0ab47feb323a33ffbed8b283870c", null ],
      [ "u8Hour", "structstc__rtc__alarm__t.html#a179287f810fc93dcb9c1d6cf2af02674", null ],
      [ "u8Day", "structstc__rtc__alarm__t.html#a79cc347a6f3340319374b8cca623826f", null ],
      [ "u8Month", "structstc__rtc__alarm__t.html#a8a6be822d43a1533868363c74419bc85", null ],
      [ "u16Year", "structstc__rtc__alarm__t.html#a96d397e87bf2a1b04855bbc3911d884e", null ]
    ] ],
    [ "stc_rtc_config_t", "structstc__rtc__config__t.html", [
      [ "enClkSel", "structstc__rtc__config__t.html#aff6abf522d0f60b20d45e3eff59dd435", null ],
      [ "u32ClkPrescaler", "structstc__rtc__config__t.html#a11109e5e7749e2b9f815c141248727f9", null ],
      [ "bEnSuboutDivider", "structstc__rtc__config__t.html#a272a68a69393faead952f8710198bbf7", null ],
      [ "enDividerRatio", "structstc__rtc__config__t.html#a47d954b8ca774c713391e49022936e2e", null ],
      [ "enRtccoSel", "structstc__rtc__config__t.html#a2ad29bdc7c95b7830631e449b1ceb88a", null ],
      [ "pstcFreqCorrConfig", "structstc__rtc__config__t.html#a8e387c4245017bba93348bd75c9ccc33", null ],
      [ "pstcTimeDate", "structstc__rtc__config__t.html#af36f7eb20bfdbe3cc57061d3ef4c4549", null ],
      [ "pstcAlarm", "structstc__rtc__config__t.html#a099f4d45677fc0b0697eadf8997d0db1", null ],
      [ "pstcTimer", "structstc__rtc__config__t.html#abfbc2320b0349e635cce4ed3aee4f5b4", null ],
      [ "pstcIrqEn", "structstc__rtc__config__t.html#a50032f0e5b55535b1135d15f8b2715a1", null ],
      [ "pstcIrqCb", "structstc__rtc__config__t.html#a13facf91d5bac8d7dfa75e5ee372cf76", null ],
      [ "bTouchNvic", "structstc__rtc__config__t.html#a24c91ab897520914cf85f8f9eb87d0d8", null ],
      [ "bRunNotInit", "structstc__rtc__config__t.html#aae0add4afd60243ebe1c47b8257867ff", null ]
    ] ],
    [ "stc_rtc_instance_data_t", "structstc__rtc__instance__data__t.html", [
      [ "pstcInstance", "structstc__rtc__instance__data__t.html#acb9861e562218e0fcd231764610853ec", null ],
      [ "stcInternData", "structstc__rtc__instance__data__t.html#a919596f0993d1fe4a7b1e9ed500d4c9f", null ]
    ] ]
];