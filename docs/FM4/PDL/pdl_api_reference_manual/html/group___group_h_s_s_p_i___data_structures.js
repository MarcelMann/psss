var group___group_h_s_s_p_i___data_structures =
[
    [ "stc_hsspi_config_t", "structstc__hsspi__config__t.html", [
      [ "enClockDivider", "structstc__hsspi__config__t.html#a539ddf6ff7728bc4e5677dfccd808e7d", null ],
      [ "enClockSelection", "structstc__hsspi__config__t.html#ad8467fa649a78d1aca52d13725a1c8af", null ],
      [ "u8TxFifoThresholdLow", "structstc__hsspi__config__t.html#ab250008573e7049c639ca65b53291005", null ],
      [ "pfnTxStatusCallback", "structstc__hsspi__config__t.html#a18fe916837d5bc8efd437c3411a7eabe", null ],
      [ "enMemoryBankSize", "structstc__hsspi__config__t.html#aa2b6177965e20ae7a5bfc6c6cf34924d", null ],
      [ "enDirectModeProtocol", "structstc__hsspi__config__t.html#a84c9250c8f620cd16d523cbb5916af36", null ],
      [ "enCommandSequencerModeProtocol", "structstc__hsspi__config__t.html#a8fa6bac83fae68e00cc0645ae0702b47", null ],
      [ "enMemoryType", "structstc__hsspi__config__t.html#a901633fce32846c3d6c264c63b3f76e4", null ],
      [ "u16IdleTimeOut", "structstc__hsspi__config__t.html#a603486b5c3214a365bdf61a6b900019c", null ],
      [ "enFifoWidth", "structstc__hsspi__config__t.html#ac45caecd68c1ffca5ad531b8c0495abc", null ],
      [ "bMasterOperation", "structstc__hsspi__config__t.html#a91d41307c02f3fb518bd5c3b02473d9d", null ],
      [ "bTxDmaBridgeEnable", "structstc__hsspi__config__t.html#a822343e89d0c7e603c6f7b8e75a915be", null ],
      [ "bRxDmaBridgeEnable", "structstc__hsspi__config__t.html#ae6db9960e12596367bd102f99b189fec", null ]
    ] ],
    [ "stc_hsspi_ext_device_config_t", "structstc__hsspi__ext__device__config__t.html", [
      [ "enClockDivider", "structstc__hsspi__ext__device__config__t.html#a2f4247fd4d28aa4c6e8813852ad55292", null ],
      [ "bShiftLsbFirst", "structstc__hsspi__ext__device__config__t.html#aab7a6c4307d2e81302206b3518acce22", null ],
      [ "enClockDelay", "structstc__hsspi__ext__device__config__t.html#a5626d130648ed82458ee50f3ec413324", null ],
      [ "bSlaveSelectPolarityHigh", "structstc__hsspi__ext__device__config__t.html#a180df0ddb1ff5c2ee3704624e8558081", null ],
      [ "enClockMode", "structstc__hsspi__ext__device__config__t.html#abd35678d00a62474382cac8530b289bb", null ],
      [ "bSafeSync", "structstc__hsspi__ext__device__config__t.html#aee4e79e682767447cf166062422a1231", null ],
      [ "enEndianess", "structstc__hsspi__ext__device__config__t.html#a3f7137763c92c2373083482e6c1e1de7", null ],
      [ "u8ReadDeselectTime", "structstc__hsspi__ext__device__config__t.html#ad6e76e149399c733dd51ee6daa4f9482", null ],
      [ "u8WriteDeselectTime", "structstc__hsspi__ext__device__config__t.html#a10ade73139b584eae39e054ac1672d38", null ],
      [ "bCompensatedClock", "structstc__hsspi__ext__device__config__t.html#a64ecb7d68905042c7c2bd496827ac2f6", null ]
    ] ],
    [ "stc_hsspi_command_sequencer_control_t", "structstc__hsspi__command__sequencer__control__t.html", [
      [ "enCommand", "structstc__hsspi__command__sequencer__control__t.html#a29ef124ec247da63dd4762e466cabf29", null ],
      [ "u8Data", "structstc__hsspi__command__sequencer__control__t.html#a7ebff36c1ad01ed68a8575321a07ff6f", null ],
      [ "bCont", "structstc__hsspi__command__sequencer__control__t.html#a40ce63f4a4092ffbadc955b01d3ee039", null ],
      [ "enTransferProtocol", "structstc__hsspi__command__sequencer__control__t.html#a8920441b3ed919d09b85e7fa1b377b81", null ]
    ] ],
    [ "stc_hsspi_linked_data_list_t", "structstc__hsspi__linked__data__list__t.html", [
      [ "pu8Data", "structstc__hsspi__linked__data__list__t.html#ada92f7d53e70f847c645b8d1bbeba225", null ],
      [ "u16ListItemDataSize", "structstc__hsspi__linked__data__list__t.html#ac6ec79830fb61555d73b373eaed0f567", null ],
      [ "pstcNext", "structstc__hsspi__linked__data__list__t.html#a7de563cd018b4a4fdb6b38ca3d54710d", null ]
    ] ],
    [ "stc_hsspi_intern_data_t", "structstc__hsspi__intern__data__t.html", [
      [ "pfnRxStatusCallbackFunction", "structstc__hsspi__intern__data__t.html#ab23da135a34de90a7e23e27dbbfebae0", null ],
      [ "pfnTxStatusCallbackFunction", "structstc__hsspi__intern__data__t.html#a84b6daa48369cea558e9d22ebe1a3754", null ],
      [ "pu8RXBuffer", "structstc__hsspi__intern__data__t.html#a07fb2ab0098f69504951e7a8702fd598", null ],
      [ "u8BkRXFTH", "structstc__hsspi__intern__data__t.html#ab67eb711ff6f617bb4b234c2dbafb775", null ],
      [ "u8BkRFMTC", "structstc__hsspi__intern__data__t.html#a31d72d078b73e5b908687b3b7e4f4d5f", null ],
      [ "enClkMode", "structstc__hsspi__intern__data__t.html#a73c7267e19ce207f985ffeb8df6feb1c", null ],
      [ "enDirectModeProtocol", "structstc__hsspi__intern__data__t.html#aa7cd64d41302f78a8f9b984d08d54ed5", null ],
      [ "bMasterOperation", "structstc__hsspi__intern__data__t.html#a0a1bd1a3750aa5b828b00291beb63784", null ]
    ] ],
    [ "stc_hsspi_instance_data_t", "structstc__hsspi__instance__data__t.html", [
      [ "pstcInstance", "structstc__hsspi__instance__data__t.html#a6934599d65890130895604e8b72e0194", null ],
      [ "bIsHsSpi", "structstc__hsspi__instance__data__t.html#a1d41640fe9183ce5fa42c980efd4755d", null ],
      [ "stcInternData", "structstc__hsspi__instance__data__t.html#a1419e3295f7cdd9d41118e665ae704e2", null ]
    ] ]
];