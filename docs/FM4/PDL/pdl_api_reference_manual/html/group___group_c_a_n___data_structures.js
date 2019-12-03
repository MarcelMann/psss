var group___group_c_a_n___data_structures =
[
    [ "stc_can_bitrate_t", "structstc__can__bitrate__t.html", [
      [ "u8TimeSegment1", "structstc__can__bitrate__t.html#a7cf266d8547a1b48d171448785fe70a5", null ],
      [ "u8TimeSegment2", "structstc__can__bitrate__t.html#a6067e944ab59d1840cd82e07964f286e", null ],
      [ "u8SyncJumpWidth", "structstc__can__bitrate__t.html#ad34aef051c72f0a683d7c4a5449d12af", null ],
      [ "u16Prescaler", "structstc__can__bitrate__t.html#ad2bc88e70521c54a3684a236fe34ac4c", null ],
      [ "enCanPrescaler", "structstc__can__bitrate__t.html#a6a036e0d956da90233ed1a1c9201dbef", null ]
    ] ],
    [ "stc_can_msg_id_t", "structstc__can__msg__id__t.html", [
      [ "u32Identifier", "structstc__can__msg__id__t.html#afb1dfa07c6435bf506f3c3baa0758edc", null ],
      [ "bExtended", "structstc__can__msg__id__t.html#ae9376c66860df3cd263996dd6f623e7c", null ]
    ] ],
    [ "stc_can_msg_data_t", "structstc__can__msg__data__t.html", [
      [ "au8Data", "structstc__can__msg__data__t.html#ab05d517f91b2097fa3b3d91439f4f999", null ],
      [ "u8DataLengthCode", "structstc__can__msg__data__t.html#a38396e7c72a04da2745e61ef11ee0efd", null ]
    ] ],
    [ "stc_can_msg_t", "structstc__can__msg__t.html", [
      [ "stcIdentifier", "structstc__can__msg__t.html#a5d1f3c20df2663197ad4c9f8cb441e56", null ],
      [ "stcData", "structstc__can__msg__t.html#a978398e794dd21fb0715b755f9d2f6b2", null ],
      [ "bOverflow", "structstc__can__msg__t.html#a44c7dddcd2d300121d368a59f30a54ac", null ],
      [ "bNew", "structstc__can__msg__t.html#ace3caffc9a2872ec91481e0d1a05be88", null ]
    ] ],
    [ "stc_can_interrupt_handling_t", "structstc__can__interrupt__handling__t.html", [
      [ "pstcMsgBuffer", "structstc__can__interrupt__handling__t.html#add3fca7c9ef3c4b0a694b676b7259db9", null ],
      [ "pfnCanTxInterruptFunction", "structstc__can__interrupt__handling__t.html#afe0ffe88b063534a2c5b3ba6a7fe0cdb", null ],
      [ "pfnCanRxInterruptFunction", "structstc__can__interrupt__handling__t.html#ad17e8b8836b1cf0f45a1b20dfa5c29d7", null ]
    ] ],
    [ "stc_can_notification_t", "structstc__can__notification__t.html", [
      [ "pfnCanStatusInterruptFunction", "structstc__can__notification__t.html#a61e8ce4e41b9335b437729d82e7a7a1e", null ],
      [ "pfnCanErrorInterruptFunction", "structstc__can__notification__t.html#adb0e8873be9ed89f9f7607d42588fabe", null ]
    ] ],
    [ "stc_can_config_t", "structstc__can__config__t.html", [
      [ "pfnStatusCallback", "structstc__can__config__t.html#a5f7b1b25fa2810950f6fdcb763a5e3d5", null ],
      [ "pfnErrorCallback", "structstc__can__config__t.html#a8d189de9ced284080d01007aa8af617d", null ],
      [ "bDisableAutomaticRetransmission", "structstc__can__config__t.html#a52c6eabd55f70ad01662d28c889303c1", null ],
      [ "stcBitrate", "structstc__can__config__t.html#af45e8c13e37b18e0c3d89907feda2298", null ],
      [ "bTouchPrescaler", "structstc__can__config__t.html#ad5d74576b3ef729c7a6929dff7a3d391", null ]
    ] ],
    [ "stc_can_intern_data_t", "structstc__can__intern__data__t.html", [
      [ "stcCanInterruptHandling", "structstc__can__intern__data__t.html#a47752806a2c517150bebf936fb98ca9a", null ],
      [ "stcCanNotificationCb", "structstc__can__intern__data__t.html#aba8fb1203398c908e651d54dc1f43c01", null ],
      [ "bEobZero", "structstc__can__intern__data__t.html#a7a74083faa02b769807919733b218eb6", null ]
    ] ],
    [ "stc_can_instance_data_t", "structstc__can__instance__data__t.html", [
      [ "pstcInstance", "structstc__can__instance__data__t.html#a46ead2c46c699a760b55e236d0c9ed08", null ],
      [ "stcInternData", "structstc__can__instance__data__t.html#a8782756ee4365a4008791cdec4b68d06", null ]
    ] ],
    [ "can_tx_msg_func_ptr_t", "group___group_c_a_n___data_structures.html#gaf68ef6f6d854a808b777f6c8cb969063", null ],
    [ "can_rx_msg_func_ptr_t", "group___group_c_a_n___data_structures.html#gab7a5a581f5d63afe396a53e4fc18800e", null ],
    [ "can_status_chg_func_ptr_t", "group___group_c_a_n___data_structures.html#ga31e9ff6fcee25b3d358cb389fb53b356", null ],
    [ "can_error_func_ptr_t", "group___group_c_a_n___data_structures.html#gadcf1d987cfafc59d3e748f009c1e107e", null ]
];