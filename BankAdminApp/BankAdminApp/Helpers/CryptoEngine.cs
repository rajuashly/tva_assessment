using System;
using System.Security.Cryptography;
using System.Text;

namespace BankingAdminApp.Helpers
{
    /// <summary>
    /// modified from the following post
    /// https://dotnetcodr.com/2015/10/23/encrypt-and-decrypt-plain-string-with-triple-des-in-c/
    /// </summary>
    public static class CryptoEngine
    {
        public class Secrets
        {
            public string Key { get; set; }
        }

        public static string Encrypt(string source, string key)
        {
            var byteHash = MD5.HashData(Encoding.UTF8.GetBytes(key));
            var tripleDes = new TripleDESCryptoServiceProvider
            {
                Key = byteHash, 
                Mode = CipherMode.ECB
            };
            
            var byteBuff = Encoding.UTF8.GetBytes(source);
            return Convert.ToBase64String(tripleDes.CreateEncryptor()
                .TransformFinalBlock(byteBuff, 0, byteBuff.Length));
        }

        public static string Decrypt(string encodedText, string key)
        {
            var byteHash = MD5.HashData(Encoding.UTF8.GetBytes(key));
            var tripleDes = new TripleDESCryptoServiceProvider
            {
                Key = byteHash, 
                Mode = CipherMode.ECB
            };
            var byteBuff = Convert.FromBase64String(encodedText);
            return Encoding.UTF8.GetString(
                tripleDes
                    .CreateDecryptor()
                    .TransformFinalBlock(byteBuff, 0, byteBuff.Length));
        }

        public static bool IsKeysValid(string[] keys, Dictionary<string, string> values)
        {
            bool valid = true;
            foreach (string key in keys)
            {
                var value = values.ContainsKey(key) ? values[key] : null;
                if (string.IsNullOrWhiteSpace(value))
                {
                    valid = false;
                }
            }
            return valid;
        }
        public static Dictionary<string, string> GetValues(string secret)
        {
            Dictionary<string, string> myValues = new Dictionary<string, string>();

            if (!string.IsNullOrWhiteSpace(secret))
            {
                try
                {
                    secret = Decrypt(secret, "unicorns-are-the-best");

                    string[] elements = secret.Split('=', '&');

                    for (int i = 0; i < elements.Length; i += 2)
                    {
                        myValues.Add(elements[i], elements[i + 1]);
                    }
                }
                catch (Exception ex)
                {

                }
     
            }
            return myValues;
        }
        public static string DecryptSecretForArg(string secret, string parameterKey)
        {
            var result = string.Empty;
            var values = GetValues(secret);

            if (values != null && values.Count > 0)
            {
                string[] keys = { parameterKey };
                bool keysValid = IsKeysValid(keys, values);
                if (keysValid)
                {
                    var value = values.ContainsKey(keys[0]) ? values[(keys[0])] : null;
                    if (!string.IsNullOrWhiteSpace(value))
                    {
                        result = value;
                    }
                }
            }
            return result;
        }
    }
}