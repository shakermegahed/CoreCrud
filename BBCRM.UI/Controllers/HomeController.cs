using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using dryve.UI.Models;
using dryve.Domain.Interfaces;
using dryve.Controllers;
using Microsoft.AspNetCore.Hosting;
using dryve.Entities.Common;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using dryve.Entities.DomainModels;

namespace dryve.UI.Controllers
{
    public class HomeController : BaseController
    {
        private readonly IDestinationManager _destinationManager;
        private readonly IMapper _mapper;

        public HomeController(IDestinationManager destinationManager, IHostingEnvironment hostingEnvironment,
            IMapper mapper) :base(hostingEnvironment)
        {
            this._destinationManager = destinationManager;
            this._mapper = mapper;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [HttpGet]
        [Route("home/tbl")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<DestinationModel>, DestinationModel>> GetAll()
        {
            var cities = await _destinationManager.GetAll();
            return cities;
        }

        [HttpDelete("delete/{DestinationId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid DestinationId)
        {

            return await _destinationManager.DeleteDestination(DestinationId);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
