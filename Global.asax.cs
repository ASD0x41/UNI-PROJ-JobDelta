using System;

using System.Diagnostics;
//using System.ComponentModel;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.IO;
using System.Web.Hosting;

namespace JobDelta
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            Application["currentUser"] = -1;
            Application["curUserType"] = -1;

            string path = Server.MapPath("~/chat-api-project/chatapi.bat");
            string directory = Server.MapPath("~/chat-api-project");
            System.Diagnostics.Process.Start(new System.Diagnostics.ProcessStartInfo()
            {
                FileName = path,
                WorkingDirectory = directory
            });

            /*Process chat = new Process();
            chat.StartInfo.FileName = "H:\\DBLP\\JobDelta\\chat-api-project\\chatapi.bat";
            chat.StartInfo.WorkingDirectory = Path.GetDirectoryName("H:\\DBLP\\JobDelta\\chat-api-project\\chatapi.bat");
            chat.StartInfo.UseShellExecute = false;
            chat.Start();*/

            // add exit to app end?????
        }

        public static void RegisterShutdownTask(Action task)
        {
            //HostingEnvironment.RegisterShutdownTask(task);
        }

        protected void Application_End(object sender, EventArgs e)
        {
            /*RegisterShutdownTask(() =>
            {
                Debug.WriteLine("Application_End called.");
                string processName = "chatapi";
                foreach (var process in System.Diagnostics.Process.GetProcessesByName(processName))
                {
                    process.Kill();
                }
                // Code to execute when the application ends
            });*/

            

            
        }
    }
}