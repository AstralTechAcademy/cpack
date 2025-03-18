#include <string>

class MyLib
{
    private:
    std::string message = "This is my lib message";

    public:
    std::string getMessage(void) const;
};