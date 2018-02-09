using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MyFirstChallenge.Startup))]
namespace MyFirstChallenge
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
