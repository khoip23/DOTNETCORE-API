using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using dotnet_v8_blazor.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

//using web_api_base.Models;

namespace dotnet_v8_blazor_.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DemoController : ControllerBase
    {
        private readonly StoreCyberSoftContext _context = new StoreCyberSoftContext();

        public DemoController()
        {
            // _context = new StoreCybersoftContext();
        }

        [HttpGet("GetAll")]
        public async Task<ActionResult> GetAll()
        {
            List<User> lstUser = _context.Users.ToList();
            return Ok(lstUser);
        }

        [HttpGet("GetAllSQLRaw")]
        public async Task<ActionResult> GetAllSQLRaw()
        {
            List<User> lstUser = _context.Users.FromSqlRaw("Select * From Users").ToList();
            return Ok(lstUser);
        }

        [HttpPost("AddUser")]
        public async Task<ActionResult> AddUser([FromBody] User newUser)
        {
            //linq:
            _context.Users.Add(newUser);
            _context.SaveChanges(); //Lưu vào db thật
            return Ok(_context.Users.ToList());
        }
    }
}
