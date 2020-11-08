
using BB.CRM.Core.API;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System;
using System.IO;
using System.Net;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [Authorize]
    public class File : BaseController
    {
        public File(IHostingEnvironment hostingEnvironment)
          : base(hostingEnvironment)
        {

        }

        [HttpPost]
        [DisableFormValueModelBinding]
        [DisableRequestSizeLimit]
        [ApiExplorerSettings(IgnoreApi = true)]
        public async Task<IActionResult> FileUpload()
        {
            try
            {
                string file_name = Path.GetRandomFileName();
                string root_path = _hostingEnvironment.ContentRootPath;
                var upload_path = this.GetFilesUploadPath(true);

                var fileUploadForm = await FileUploadHelper.ParseRequestForm(this, async (section, formFileInfo) =>
                {
                    // TODO: This function will be called every time parser got a file
                    // but this controller only supports one file per request.
                    // Therefore the last file will be the one to be saved if the client
                    // passed up more than one file.

                    file_name += Path.GetExtension(formFileInfo.FileName);
                    var upload_file_path = Path.Combine(upload_path, file_name);

                    using (var fileStream = System.IO.File.Create(upload_file_path))
                    {
                        await section.Body.CopyToAsync(fileStream);
                    }

                }, new FileUploadForm());
                return Content(file_name);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("{fileName}")]
        public async Task<IActionResult> GetFile(string fileName)
        {
            if (string.IsNullOrEmpty(fileName))
                return Content("filename not present");

            var filePath = Path.Combine(this.GetFilesUploadPath(), fileName);

            var memory = new MemoryStream();
            using (var stream = new FileStream(filePath, FileMode.Open))
            {
                await stream.CopyToAsync(memory);
            }
            memory.Position = 0;
            return File(memory, this.GetContentType(filePath), Path.GetFileName(filePath));

        }

        [HttpDelete]
        public void FileDelete()
        {
            using (var reader = new StreamReader(Request.Body))
            {
                var filename = reader.ReadToEnd();
                string root_path = _hostingEnvironment.ContentRootPath;
                var upload_path = Path.Combine(root_path, UPLOAD_FOLDER_TEMP);
                var upload_file_path = Path.Combine(upload_path, filename);

                if (System.IO.File.Exists(upload_file_path))
                {
                    System.IO.File.Delete(upload_file_path);
                }
            }
        }
    }

    public class FileUploadForm
    {
        /// <summary>
        /// A unique identifier that identifies an upload. Used for chunking.
        /// </summary>
        public string Uuid { get; set; }

        /// <summary>
        /// The name of the file.
        /// </summary>
        public string filename { get; set; }

        /// <summary>
        /// The total size of the file.
        /// </summary>
        public long totalFileSize { get; set; }
    }
}