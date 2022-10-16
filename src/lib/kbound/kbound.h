#ifndef BMC_KBOUND_H
#define BMC_KBOUND_H


class kbound{

private:
  options& o;

public:
  // dump to kbound
  void dump_indent(std::ostream o_cpp, unsigned k);

};

#endif // BMC_KBOUND_H
