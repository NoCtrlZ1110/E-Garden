﻿using System;
using System.Collections.Generic;
using System.IO;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;

namespace UET.EGarden.DataExporting.Excel.NPOI
{
    public abstract class NpoiExcelImporterBase<TEntity>
    {
        protected List<TEntity> ProcessExcelFile(byte[] fileBytes, Func<ISheet, int, TEntity> processExcelRow)
        {
            var entities = new List<TEntity>();

            using (var stream = new MemoryStream(fileBytes))
            {
                var workbook = new XSSFWorkbook(stream);
                for (var i = 0; i < workbook.NumberOfSheets; i++)
                {
                    var entitiesInWorksheet = ProcessWorksheet(workbook.GetSheetAt(i), processExcelRow);
                    entities.AddRange(entitiesInWorksheet);
                }
            }

            return entities;
        }

        private List<TEntity> ProcessWorksheet(ISheet worksheet, Func<ISheet, int, TEntity> processExcelRow)
        {
            var entities = new List<TEntity>();

            var rowEnumerator = worksheet.GetRowEnumerator();
            rowEnumerator.Reset();

            var i = 0;
            while (rowEnumerator.MoveNext())
            {
                if (i == 0)
                {
                    //Skip header
                    i++;
                    continue;
                }
                try
                {
                    var entity = processExcelRow(worksheet, i++);
                    if (entity != null)
                    {
                        entities.Add(entity);
                    }
                }
                catch (Exception)
                {
                    //ignore
                }
            }

            return entities;
        }
    }
}