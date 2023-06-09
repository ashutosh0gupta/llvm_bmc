#include "utils.h"

std::vector<std::pair<std::string, std::string>> replacements {
    { "/", "-" },
    { "|", ""  },
    // ...
    { "�", "i" }
};

for ( auto const &r : replacements) {
    str.replace(r.first, r.second);
}
