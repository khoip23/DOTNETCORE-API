using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using webapi_blazor.models.EbayDB;

//using dotnet01_web_api_blazor-master.Models;

namespace webapi_blazor.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly EbayContext _context;

        public UserController(EbayContext context)
        {
            _context = context;
        }

        [HttpGet("/user/getall")]
        public IActionResult Get()
        {
            return Ok(_context.Users.Skip(10).Take(10));
        }
    }
}
