using AutoMapper;
using BB.CRM.Domain.Interfaces;
using BB.CRM.Entities.Common;
using BB.CRM.Entities.DomainModels;
using BB.CRM.WebApi.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static BB.CRM.Core.Constants;

namespace BB.CRM.WebApi.Controllers
{

    [Produces("application/json")]
    [Route("api/[controller]")]
    [Authorize]
    public class FileUpload : BaseController
    {
        #region[vars]
        private readonly IMapper _mapper;
        private readonly IFileUploadManager _fileUploadManager;
        #endregion

        #region[ctor]
        public FileUpload(IMapper mapper, IFileUploadManager fileUploadManager, IHostingEnvironment hostingEnvironment) : base(hostingEnvironment)
        {
            _mapper = mapper;
            _fileUploadManager = fileUploadManager;
        }
        #endregion

        #region[action]

        [HttpPost]
        public async Task<CommandResult<Guid>> CreateFileUpload([FromBody] CreateFileUploadViewModel viewModel)
        {
            var createFileUploadModel = _mapper.Map<FileUploadModel>(viewModel);
            var result = await _fileUploadManager.CreateFileUpload(createFileUploadModel);
            if (result.IsSucceeded && !string.IsNullOrEmpty(createFileUploadModel.FileName))
            {
                ConfirmFileAdded(createFileUploadModel.FileName);
            }

            return result;
        }

        [HttpPut]
        public async Task<CommandResult<bool>> UpdateFileUpload([FromBody] UpdateFileUploadViewModel viewModel)
        {
            var updateFileUploadModel = _mapper.Map<FileUploadModel>(viewModel);
            var result = await _fileUploadManager.UpdateFileUpload(updateFileUploadModel);
            if (result.IsSucceeded && !string.IsNullOrEmpty(updateFileUploadModel.FileName))
            {
                ConfirmFileAdded(updateFileUploadModel.FileName);
            }
            return result;
        }

        [HttpDelete("DeleteTemporary/{FileUploadId}")]
        public async Task<CommandResult<Boolean>> DeleteTemporary(Guid FileUploadId)
        {
            return await _fileUploadManager.DeleteFileUploadTemporary(FileUploadId);
        }
        [HttpDelete("DeletePermanently/{FileUploadId}/{fileName}")]
        public async Task<CommandResult<Boolean>> DeletePermanently(Guid FileUploadId, string fileName)
        {
            var result = await _fileUploadManager.DeleteFileUploadPermanently(FileUploadId);
            if (result.IsSucceeded)
            {
                this.DeleteFile(fileName);
            }
            return result;
        }

        [HttpGet("restore/{FileUploadId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid FileUploadId)
        {

            return await _fileUploadManager.RestoreFileUpload(FileUploadId);
        }

        [HttpGet("{FileUploadId}")]
        public async Task<QuerySingleResult<FileUploadViewModel>> GetFileUploadById(Guid FileUploadId)
        {
            var Country = await _fileUploadManager.GetById(FileUploadId);
            return _mapper.Map<QuerySingleResult<FileUploadViewModel>>(Country);
        }

        [HttpGet]
        public async Task<QueryMultipleResult<IEnumerable<FileUploadViewModel>, FileUploadViewModel>> GetAll()
        {
            var files = await _fileUploadManager.GetByWebsite();
            return _mapper.Map<QueryMultipleResult<IEnumerable<FileUploadViewModel>, FileUploadViewModel>>(files);
        }
        #endregion
    }
}
