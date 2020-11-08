using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using dryve.Domain.Interfaces;
using dryve.Entities.Common;
using MediatR;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using static System.Net.Mime.MediaTypeNames;

namespace dryve.Controllers
{
    public class BaseController : Controller
    {
        #region [vars]
        protected readonly IHostingEnvironment _hostingEnvironment;
        #endregion

        #region [consts]
        protected const string UPLOAD_FOLDER = "Uploads";
        protected const string UPLOAD_FOLDER_TEMP = "temp";
        protected const int THUMB_WIDTH = 180;
        protected const int THUMB_HEIGHT = 180;
        protected const string THUMB_PREFIX = "thumb_";
        protected const int MED_WIDTH = 540;
        protected const int MED_HEIGHT = 320;
        protected const string MED_PREFIX = "medium_";
        protected const int LRG_WIDTH = 1200;
        protected const int LRG_HEIGHT = 900;
        protected const string LRG_PREFIX = "large_";
        #endregion

        #region [ctor]
        public BaseController(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }
        #endregion

        public string[] supportedImageTypes = new[] { "jpg", "jpeg", "png" };
        protected void DeleteFile(string fileName, bool deleteVersions = false)
        {
            string webRootPath = _hostingEnvironment.ContentRootPath;
            string newPath = Path.Combine(webRootPath, UPLOAD_FOLDER);

            List<string> paths = new List<string>() { Path.Combine(newPath, fileName) };
            if (deleteVersions)
            {
                paths.Add(Path.Combine(newPath, $"{THUMB_PREFIX}{fileName}"));
                paths.Add(Path.Combine(newPath, $"{MED_PREFIX}{fileName}"));
                paths.Add(Path.Combine(newPath, $"{LRG_PREFIX}{fileName}"));
            }

            paths.ForEach(path =>
            {
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
            });
        }
        protected CommandResult<Boolean> DeleteTempFile(string fileName, bool deleteVersions = false)
        {
            var result = new CommandResult<Boolean>(true);

            string webRootPath = _hostingEnvironment.ContentRootPath;
            string newPath = Path.Combine(webRootPath, UPLOAD_FOLDER_TEMP);
            List<string> paths = new List<string>() { Path.Combine(newPath, fileName) };
            if (deleteVersions)
            {
                paths.Add(Path.Combine(newPath, $"{THUMB_PREFIX}{fileName}"));
                paths.Add(Path.Combine(newPath, $"{MED_PREFIX}{fileName}"));
                paths.Add(Path.Combine(newPath, $"{LRG_PREFIX}{fileName}"));
            }
            paths.ForEach(path =>
            {
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
            });

            return result;
        }
        protected string GetFilesUploadPath(bool isTemp = false)
        {
            string webRootPath = _hostingEnvironment.ContentRootPath;
            var uploadFolder = isTemp ? Path.Combine(UPLOAD_FOLDER, UPLOAD_FOLDER_TEMP) : UPLOAD_FOLDER;
            return Path.Combine(webRootPath, uploadFolder);
        }

        protected void ConfirmImageAdded(string image)
        {
            var uploadTempPath = GetFilesUploadPath(isTemp: true);
            var uploadPath = GetFilesUploadPath(isTemp: false);


           
        }

        protected void ConfirmFileAdded(string file)
        {
            var uploadTempPath = GetFilesUploadPath(isTemp: true);

            var uploadPath = GetFilesUploadPath(isTemp: false);

            string tempFilePath = Path.Combine(uploadTempPath, file);

            if (System.IO.File.Exists(tempFilePath))
            {
                var originalFinalPath = Path.Combine(uploadPath, file);
                System.IO.File.Move(tempFilePath, originalFinalPath);
            }
        }

        protected string GetContentType(string path)
        {
            var types = GetMimeTypes();
            var ext = Path.GetExtension(path).ToLowerInvariant();
            return types[ext];
        }
        private Dictionary<string, string> GetMimeTypes()
        {
            return new Dictionary<string, string>
            {
                {".txt", "text/plain"},
                {".pdf", "application/pdf"},
                {".doc", "application/vnd.ms-word"},
                {".docx", "application/vnd.ms-word"},
                {".xls", "application/vnd.ms-excel"},
                {".xlsx", "application/vnd.openxmlformats/officedocument.spreadsheetml.sheet"},
                {".png", "image/png"},
                {".jpg", "image/jpeg"},
                {".jpeg", "image/jpeg"},
                {".gif", "image/gif"},
                {".csv", "text/csv"}
            };
        }

  
    }
}
