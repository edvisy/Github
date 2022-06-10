using System;

namespace Visy.Middleware.Pipelines.ExcelOrderToXML
{
    /// <summary>
    /// Represents an Excel cell with detailed information.
    /// </summary>
    /// 
    /// Copy From Sergiy's Code

    public class CellCoords
    {
        #region Public Fields (easy access)

        public int RowIndex = 0;
        public int ColIndex = 0;
        public string ColStr = null;
        // Excel human readable Cell location e.g. B4
        public string Location = null;
        // Cell description e.g. Week Start Location
        public string Name = null;

        #endregion

        #region Constructors

        public CellCoords()
        {}

        public CellCoords(int rowIndex, int colIndex)
        {
            RowIndex = rowIndex;
            ColIndex = colIndex;
        }

        public CellCoords(int rowIndex, int colIndex, string location)
        {
            RowIndex = rowIndex;
            ColIndex = colIndex;
            Location = location;
        }

        public CellCoords(int rowIndex, int colIndex, string location, string name)
        {
            RowIndex = rowIndex;
            ColIndex = colIndex;
            Location = location;
            Name = name;
        }

        #endregion

        #region Public Methods

        public string XYToCell(string x, int y)
        {
            return x + y.ToString();
        }

        /// <summary>
        /// Returns a formatted string containing current Cell Coords values.
        /// </summary>
        /// <remarks>
        /// Useful for error reporting and troubleshooting.
        /// </remarks>
        /// <returns>A formatted string containing Cell information.</returns>
        public string ToCurrentString()
        {
            return "Cell coords (Row: " + (RowIndex+1) + ", Col: " + (ColIndex+1) + 
                (String.IsNullOrEmpty(Location) ? "" : ", Location: " + Location) + ")";
        }

        #endregion
    }
}
