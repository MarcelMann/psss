var group___group_s_d_i_f___data_structures =
[
    [ "stc_sdif_err_irq_en_t", "structstc__sdif__err__irq__en__t.html", [
      [ "u16ErrStatus", "structstc__sdif__err__irq__en__t.html#aa3c22a71e24f19fbea259589828c69c2", null ],
      [ "CmdTimeoutErr", "structstc__sdif__err__irq__en__t.html#a7fb0c51787e980fb68301feb2adb9153", null ],
      [ "CmdCrcErr", "structstc__sdif__err__irq__en__t.html#aa0b408d02e6a4222763f749abd92a7b4", null ],
      [ "CmdEndBitErr", "structstc__sdif__err__irq__en__t.html#ad532e82373becef7ad575217d73f069c", null ],
      [ "CmdIndexErr", "structstc__sdif__err__irq__en__t.html#aaefcc55f714c90a1f9e38b3483590f63", null ],
      [ "DataTimeoutErr", "structstc__sdif__err__irq__en__t.html#a6fd18c1df96066630a30599397ecf8f9", null ],
      [ "DataCrcErr", "structstc__sdif__err__irq__en__t.html#a053719ea4a967eb91cc1077fe4e6fb1d", null ],
      [ "DataEndBitErr", "structstc__sdif__err__irq__en__t.html#ae056511b3849ef056ff73df314a401c6", null ],
      [ "CurrentLimitErr", "structstc__sdif__err__irq__en__t.html#aa4c0054e3f97dbcecfe65dbae9fd370b", null ],
      [ "AutoCmdErr", "structstc__sdif__err__irq__en__t.html#aeb458613f4c737f59eafe68857a86dc8", null ],
      [ "AdmaErr", "structstc__sdif__err__irq__en__t.html#aa9375fdb5735e49e51dfd4e38d00bb7c", null ],
      [ "TuningErr", "structstc__sdif__err__irq__en__t.html#a258fda46fafbd9165a92848015009e2c", null ],
      [ "Reserved", "structstc__sdif__err__irq__en__t.html#a02c50969054c1ccc030998750d53a6f6", null ]
    ] ],
    [ "stc_sdif_err_irq_cb_t", "structstc__sdif__err__irq__cb__t.html", [
      [ "pfnCmdTimeoutErrIrqCb", "structstc__sdif__err__irq__cb__t.html#a85f892994d14fb0d7224d38c602c2521", null ],
      [ "pfnCmdCrcErrIrqCb", "structstc__sdif__err__irq__cb__t.html#a606d0f53b18280cfa984274a1bedf7c9", null ],
      [ "pfnCmdEndBitErrIrqCb", "structstc__sdif__err__irq__cb__t.html#ab14074c79ddc21fd395be3e861ec4ed6", null ],
      [ "pfnCmdIndexErrIrqCb", "structstc__sdif__err__irq__cb__t.html#a50d7ec2095da75c555fce4ed2f554cb3", null ],
      [ "pfnDataTimeoutErrIrqCb", "structstc__sdif__err__irq__cb__t.html#a02d2b39f4d4c48f898d00700439cfe0e", null ],
      [ "pfnDataEndBitErrIrqCb", "structstc__sdif__err__irq__cb__t.html#ab4bc226144c815a9cf7380dacae4bead", null ],
      [ "pfnDataCrcErrIrqCb", "structstc__sdif__err__irq__cb__t.html#a49b7178a33bbe0bd753396e3e0558cc5", null ],
      [ "pfnCurrentLimitErrIrqCb", "structstc__sdif__err__irq__cb__t.html#a719ea60cb64ad0827696888232629b4d", null ],
      [ "pfnAutoCmdErrIrqCb", "structstc__sdif__err__irq__cb__t.html#af2125230999ff46557c3cb8e732716f5", null ],
      [ "pfnAdmaErrIrqCb", "structstc__sdif__err__irq__cb__t.html#af2db193f35f636fe66bbb65ffc0b6a18", null ],
      [ "pfnTuningErrIrqCb", "structstc__sdif__err__irq__cb__t.html#a3640d21bc6168275e3bea520c4050ddb", null ]
    ] ],
    [ "stc_sdif_normal_irq_en_t", "structstc__sdif__normal__irq__en__t.html", [
      [ "u16NormalStatus", "structstc__sdif__normal__irq__en__t.html#a886711dde962f89a96e66348f4e064de", null ],
      [ "CommandComplete", "structstc__sdif__normal__irq__en__t.html#a3e3e13a213c1802fb58162b54b49a46f", null ],
      [ "TransferComplete", "structstc__sdif__normal__irq__en__t.html#a57608f4feb7943591767247461b34b6d", null ],
      [ "BlockGapEvent", "structstc__sdif__normal__irq__en__t.html#af54e78086d4f4c224bee191a48ef12ce", null ],
      [ "DmaIrq", "structstc__sdif__normal__irq__en__t.html#acb788cdf40145ac3c5f179f2927c512c", null ],
      [ "BufferWriteReady", "structstc__sdif__normal__irq__en__t.html#a2340d854bf7fd35c586a694683b933c5", null ],
      [ "BufferReadReady", "structstc__sdif__normal__irq__en__t.html#aa0c1aaffb8ae66f3f4ea73619491dda0", null ],
      [ "CardInsertion", "structstc__sdif__normal__irq__en__t.html#ae169291ff23d18909d86ab05124f5969", null ],
      [ "CardRemoval", "structstc__sdif__normal__irq__en__t.html#a823c409f3b78a08a66a515b85c5e82f2", null ],
      [ "CardIrq", "structstc__sdif__normal__irq__en__t.html#ab848cdeab57227655d573cd5439cb9ea", null ],
      [ "Reserved0", "structstc__sdif__normal__irq__en__t.html#af1280acfd126a23771b6e4475b298c03", null ]
    ] ],
    [ "stc_sdif_normal_irq_cb_t", "structstc__sdif__normal__irq__cb__t.html", [
      [ "pfnCommandCompleteIrqCb", "structstc__sdif__normal__irq__cb__t.html#a628234c105be5138068bb43e00de7d57", null ],
      [ "pfnTransferCompleteIrqCb", "structstc__sdif__normal__irq__cb__t.html#aa2c7d73639afeb04673d1af47e5c88bd", null ],
      [ "pfnBlockGapIrqCb", "structstc__sdif__normal__irq__cb__t.html#af4c6166a9c34ee8ebe7b4d76de5a8816", null ],
      [ "pfnDmaIrqCb", "structstc__sdif__normal__irq__cb__t.html#a992a5d6c8c61ce4e66e2b5bce7afc317", null ],
      [ "pfnBufferWriteReadyIrqCb", "structstc__sdif__normal__irq__cb__t.html#a9754a1bb9e1012a3f4a3a83baa99fc0b", null ],
      [ "pfnBufferReadReadyIrqCb", "structstc__sdif__normal__irq__cb__t.html#ae9ffb9618c22783eb14ad641ee3484c7", null ],
      [ "pfnCardInsertIrqCb", "structstc__sdif__normal__irq__cb__t.html#aecca8c57a606fafec6dd9b8cf6527f58", null ],
      [ "pfnCardRemovalIrqCb", "structstc__sdif__normal__irq__cb__t.html#a3f95ecdc3c2dad33c2bcdc6a4a040d19", null ],
      [ "pfnCardIrqCb", "structstc__sdif__normal__irq__cb__t.html#a6e39aa741486069e06625e15b7ccbd06", null ]
    ] ],
    [ "stc_sdif_auto_cmd_err_t", "structstc__sdif__auto__cmd__err__t.html", [
      [ "u16AutoCmdErr", "structstc__sdif__auto__cmd__err__t.html#a1c053c340b5a980b32fbec09e90df892", null ],
      [ "SdifAutoCmd12NotExecuted", "structstc__sdif__auto__cmd__err__t.html#af3ebfe1da9f6ed900ae28d6624f7e75f", null ],
      [ "SdifAutoCmdTimeoutErr", "structstc__sdif__auto__cmd__err__t.html#a2121d3d7ca0eeaa1a5b986d7552c7263", null ],
      [ "SdifAutoCmdCrcErr", "structstc__sdif__auto__cmd__err__t.html#af215b2728a2e4be42e4a0a6a5b5bef37", null ],
      [ "SdifAutoCmdEndBitErr", "structstc__sdif__auto__cmd__err__t.html#a439a759198069704142e42d4fd794d6e", null ],
      [ "SdifAutoCmdIndexErr", "structstc__sdif__auto__cmd__err__t.html#a94f616c480884b059c052c58ed9c071b", null ],
      [ "Reserved0", "structstc__sdif__auto__cmd__err__t.html#ad311339b02e8c51c61acfba219713994", null ],
      [ "SdifCmdNotIssuedByAutoCmd12", "structstc__sdif__auto__cmd__err__t.html#a11b917e8c25dde78ca8241b6e62d2d64", null ],
      [ "Reserved1", "structstc__sdif__auto__cmd__err__t.html#adea848efe8016d68fbfd77ee29b246d8", null ]
    ] ],
    [ "stc_sdif_config_t", "structstc__sdif__config__t.html", [
      [ "bSelAdma", "structstc__sdif__config__t.html#a14d3a4bba51c944eccd23058c7261e68", null ],
      [ "bEnableHighSpeed", "structstc__sdif__config__t.html#ad95dcfc98b3f192cb558b97ea8d138e7", null ],
      [ "bEnable4BitMode", "structstc__sdif__config__t.html#af8973abff7f3b448e6bdfa245fb2edfc", null ],
      [ "pstcNormalIrqEn", "structstc__sdif__config__t.html#a189c39f404d705a46990c8a05242d4a2", null ],
      [ "pstcNormalIrqCb", "structstc__sdif__config__t.html#a78819912b07e33c59a24587654c21dd8", null ],
      [ "pstcErrIrqEn", "structstc__sdif__config__t.html#a7bc32cb3b46336dc3da2e89caeffbbf8", null ],
      [ "pstcErrIrqCb", "structstc__sdif__config__t.html#a7cb0d5e664c16800ac3217ebc609e34e", null ],
      [ "bTouchNvic", "structstc__sdif__config__t.html#ac78c4dcc19a491ac98ec7a664bc0ce6f", null ]
    ] ],
    [ "stc_sdif_cmd_config_t", "structstc__sdif__cmd__config__t.html", [
      [ "u8CmdIndex", "structstc__sdif__cmd__config__t.html#aedac63efc4cb88c108e817d0095e78a2", null ],
      [ "u32Argument", "structstc__sdif__cmd__config__t.html#aa89f5e147732f6259066256462606447", null ],
      [ "enCmdType", "structstc__sdif__cmd__config__t.html#a5f7596c548bf00e08cc3fed9c3e52917", null ],
      [ "bDataPresent", "structstc__sdif__cmd__config__t.html#ad2d9933ed8d1773d071bc07d2e5e4234", null ],
      [ "bCmdIndexCheck", "structstc__sdif__cmd__config__t.html#a8931c2c439fe0460a8ea01165fb79fd9", null ],
      [ "bCmdCrcCheck", "structstc__sdif__cmd__config__t.html#a6ab337c90f8d9ea60f58068eca746afa", null ],
      [ "enResponseType", "structstc__sdif__cmd__config__t.html#a86aad11f3aae93274af368750ad61b0e", null ],
      [ "enAutoCmdType", "structstc__sdif__cmd__config__t.html#a3b3e07629b0ec90f943eb9a50c93e54b", null ]
    ] ],
    [ "stc_sdif_data_config_t", "structstc__sdif__data__config__t.html", [
      [ "bMultipleBlock", "structstc__sdif__data__config__t.html#acf3ad7f73caeb3eaf5584527eedd5dec", null ],
      [ "bRead", "structstc__sdif__data__config__t.html#a92730e11ea9759f0d67bff6ebcac1e02", null ],
      [ "u16BlockSize", "structstc__sdif__data__config__t.html#ab9ea0904a398c4c249d7c43e95a0cb37", null ],
      [ "u16BlockCount", "structstc__sdif__data__config__t.html#a0c801a2d0ec039a8118d4cdd4a17a961", null ],
      [ "bBlockCountEnable", "structstc__sdif__data__config__t.html#a27403d7dec796a984f5694da2a1de72d", null ],
      [ "bEnableDma", "structstc__sdif__data__config__t.html#a27da1c0355dcea49d26a25596376144b", null ],
      [ "u32AdmaDespTableAddress", "structstc__sdif__data__config__t.html#ab022ee5af47dbc286edce7d6515c9dc2", null ],
      [ "u8DataTimeout", "structstc__sdif__data__config__t.html#a52d0cce21a70b1bef6628796b7832781", null ]
    ] ],
    [ "stc_sdif_intern_data_t", "structstc__sdif__intern__data__t.html", [
      [ "stcNormalIrqCb", "structstc__sdif__intern__data__t.html#a930c440eecfe6bc8429ec4f56d4e4302", null ],
      [ "stcErrIrqCb", "structstc__sdif__intern__data__t.html#a8ae1a660add8493812dfd8a8358cee2b", null ]
    ] ],
    [ "stc_sdif_instance_data_t", "structstc__sdif__instance__data__t.html", [
      [ "pstcInstance", "structstc__sdif__instance__data__t.html#a42f8dfecfece4617ae20cbe9f668586e", null ],
      [ "stcInternData", "structstc__sdif__instance__data__t.html#a15364c863363f448554bff40eee50dd3", null ]
    ] ]
];