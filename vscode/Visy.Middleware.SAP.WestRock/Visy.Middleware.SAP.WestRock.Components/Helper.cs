using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.SAP.WestRock.Components
{
    public class Helper
    {
        public static System.Collections.Hashtable _collection = new System.Collections.Hashtable();

        public static int GetCurrentThreadId()
        {
            return System.Threading.Thread.CurrentThread.ManagedThreadId;
        }

        public static bool IsFirstOccurance(int threadId, string key)
        {
            lock (_collection)
            {
                OccuranceCollection col = (OccuranceCollection)_collection[threadId];

                if (col == null)
                {
                    col = new OccuranceCollection();

                    _collection.Add(threadId, col);
                }

                return col.AddIfNotExists(key);
            }
        }

        public static void ClearOccurances(int threadId)
        {
            lock (_collection)
            {
                if (_collection.Contains(threadId))
                {
                    _collection.Remove(threadId);
                }
            }
        }
    }

    internal class OccuranceCollection : System.Collections.Hashtable
    {
        public bool AddIfNotExists(string key)
        {
            if (!this.ContainsKey(key))
            {
                this.Add(key, key);

                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
