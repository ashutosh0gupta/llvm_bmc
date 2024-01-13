#ifndef BMC_KBOUND_NAME_CONVENTION_H
#define BMC_KBOUND_NAME_CONVENTION_H

#include <string>

struct NameConvention {
    // Random generation
    inline static const std::string GEN_ROUND = "gen";
    inline static const std::string UNDERSCORE_GEN_ROUND = "__" + GEN_ROUND;
    // For load
    inline static const std::string LD_SAT_CNTXT = "LDSatCntxt";
    inline static const std::string OLD_LD_SAT_CNTXT = "old_LDSatCntxt";
    inline static const std::string LD_COM_CNTXT = "LDComCntxt";
    inline static const std::string OLD_LD_COM_CNTXT = "old_LDComCntxt";
    // For store
    inline static const std::string ST_SAT_CNTXT = "STSatCntxt";
    inline static const std::string OLD_ST_SAT_CNTXT = "old_STSatCntxt";
    inline static const std::string ST_COM_CNTXT = "STComCntxt";
    inline static const std::string OLD_ST_COM_CNTXT = "old_STComCntxt";
    // For execlusive
    inline static const std::string XPENDING = "Xpending";
    // For dependency
    inline static const std::string ADDR_LRS_COM_CNTXT = "AddrLrsComCntxt";
    inline static const std::string DATA_LRS_COM_CNTXT = "DataLrsComCntxt";
    // For synchronization
    inline static const std::string LDA_COM_CNTXT = "LDAComCntxt";
    inline static const std::string STR_COM_CNTXT = "STRComCntxt";
    inline static const std::string DMB_SY_COM_CNTXT = "DMBsyComCntxt";
    inline static const std::string DMB_LD_COM_CNTXT = "DMBldComCntxt";
    inline static const std::string DMB_ST_COM_CNTXT = "DMBstComCntxt";
    inline static const std::string ISB_COM_CNTXT = "ISBComCntxt";
};

#endif // BMC_KBOUND_NAME_CONVENTION_H