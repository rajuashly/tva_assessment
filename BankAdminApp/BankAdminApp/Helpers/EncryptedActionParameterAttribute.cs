using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc.Filters;

namespace BankingAdminApp.Helpers
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class EncryptedActionParameterAttribute : ActionFilterAttribute
    {
        //public override void OnActionExecuting(ActionExecutingContext filterContext)
        //{
        //    base.OnActionExecuting(filterContext);
        //    Dictionary<string, object> decryptedParameters = new Dictionary<string, object>();
        //    if (HttpContext.Current.Request.QueryString.Get("q") != null)
        //    {
        //        string encryptedQueryString = HttpContext.Current.Request.QueryString.Get("q");
        //        try
        //        {
        //            string decrptedString = Decrypt(encryptedQueryString.ToString());
        //            string[] paramsArrs = decrptedString.Split('?');

        //            for (int i = 0; i < paramsArrs.Length; i++)
        //            {
        //                string[] paramArr = paramsArrs[i].Split('=');
        //                if (paramArr.ToList().Count > 0)
        //                {
        //                    int number;
        //                    bool isNumber = int.TryParse(paramArr[1], out number);
        //                    if (isNumber)
        //                    {
        //                        decryptedParameters.Add(paramArr[0], Convert.ToInt32(paramArr[1]));
        //                    }
        //                    else
        //                    {
        //                        decryptedParameters.Add(paramArr[0], paramArr[1]);
        //                    }
        //                }
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            Debug.Write(ex.Message);
        //        }
        //    }
        //    for (int i = 0; i < decryptedParameters.Count; i++)
        //    {
        //        filterContext.ActionParameters[decryptedParameters.Keys.ElementAt(i)] = decryptedParameters.Values.ElementAt(i);
        //    }
        //}
        //public string Decrypt(string cipherText)
        //{
        //    string EncryptionKey = "SecurePDFSend@123xxxxx123yyyyy";  //we can change the code converstion key as per our requirement, but the decryption key should be same as encryption key    
        //    cipherText = cipherText.Replace(" ", "+");
        //    //int mod4 = cipherText.Length % 4;
        //    //if (mod4 > 0)
        //    //{
        //    //    cipherText += new string('=', 4 - mod4);
        //    //}
        //    byte[] cipherBytes = Convert.FromBase64String(cipherText);
        //    using (Aes encryptor = Aes.Create())
        //    {
        //        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
        //    0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
        //});
        //        encryptor.Key = pdb.GetBytes(32);
        //        encryptor.IV = pdb.GetBytes(16);
        //        using (MemoryStream ms = new MemoryStream())
        //        {
        //            using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
        //            {
        //                cs.Write(cipherBytes, 0, cipherBytes.Length);
        //                cs.Close();
        //            }
        //            cipherText = Encoding.Unicode.GetString(ms.ToArray());
        //        }
        //    }
        //    return cipherText;
        //}
    }
}