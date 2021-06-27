#ifndef MCParamsFileSvc_hh
#define MCParamsFileSvc_hh

/*  
 * This is one implemenation of IMCParamsSvc. It allows user:
 *   + organise properties in dir/file based.
 *   + data format in file is simple, just key and val mapping
 */

#include <MCParamsSvc/IMCParamsSvc.hh>
#include <SniperKernel/SvcBase.h>
class MCParamsFileSvc: public IMCParamsSvc, public SvcBase
{
   
  
    public:
        MCParamsFileSvc(const std::string& name);
        ~MCParamsFileSvc();

        bool initialize();
        bool finalize();

        virtual bool Get(const std::string&, vec_d2d& props);
        virtual bool Get(const std::string&, vec_s2d& props);
        virtual bool Get(const std::string&, map_s2d& props); 
    private:
        std::map<std::string,std::string> m_Param2value;//this list contains the optical parameters which will be replaced;
    public:
        const std::string GetPath(const std::string & param);
        double g4string2value(std::string value);
};
      
#endif
