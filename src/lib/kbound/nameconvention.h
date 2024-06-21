#ifndef BMC_KBOUND_NAME_CONVENTION_H
#define BMC_KBOUND_NAME_CONVENTION_H

#include <string>

struct NameConvention {
    inline static const bool ENCODE_AS_PAPER = true;

    // Random generation
    inline static const std::string GEN_ROUND = "gen";
    inline static const std::string UNDERSCORE_GEN_ROUND = "__" + GEN_ROUND;
    // For load
    inline static const std::string LD_SAT_CNTXT = "LDSatCntxt";
    inline static const std::string OLD_LD_SAT_CNTXT = "old_LDSatCntxt";
    inline static const std::string LD_COM_CNTXT = "LDComCntxt";
    inline static const std::string OLD_LD_COM_CNTXT = "old_LDComCntxt";
    // TODO: Check this data structure
    inline static const std::string MAX_LD_COM_CNTXT = "MaxLDComCntxt";
    // For store
    inline static const std::string ST_SAT_CNTXT = "STSatCntxt";
    inline static const std::string OLD_ST_SAT_CNTXT = "old_STSatCntxt";
    inline static const std::string ST_COM_CNTXT = "STComCntxt";
    inline static const std::string OLD_ST_COM_CNTXT = "old_STComCntxt";
    // For release - acquire
    inline static const std::string LDA_COM_CNTXT = "LDAComCntxt";
    inline static const std::string STR_COM_CNTXT = "STRComCntxt";
    // For execlusive
    inline static const std::string XPENDING = "Xpending";
    // For dependency
    inline static const std::string ADDR_LRS_COM_CNTXT = "AddrLrsComCntxt";
    inline static const std::string DATA_LRS_COM_CNTXT = "DataLrsComCntxt";
    inline static const std::string CTRL = "Ctrl";
    // For synchronization
    inline static const std::string DMB_SY_COM_CNTXT = "DMBsyComCntxt";
    inline static const std::string DMB_LD_COM_CNTXT = "DMBldComCntxt";
    inline static const std::string DMB_ST_COM_CNTXT = "DMBstComCntxt";
    inline static const std::string ISB_COM_CNTXT = "ISBComCntxt";
    // For register
    inline static const std::string REG_CNTXT_RTRGT = "RegCntxtRTrgt";
    inline static const std::string ADDR_COM_CNTXT = "AddrComCntxt";
    // For memory
    inline static const std::string CURR_LOC_MEM_VAL =  "CurrLocMemVal";
    inline static const std::string CURR_GLOB_MEM_VAL =  "CurrGlobMemVal";
    inline static const std::string INIT_MEM_VAL =  "InitMemVal";
};

#endif // BMC_KBOUND_NAME_CONVENTION_H
