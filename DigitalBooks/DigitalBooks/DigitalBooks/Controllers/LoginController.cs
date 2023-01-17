﻿using DigitalBooks.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Text;

namespace DigitalBooks.Controllers
{
    public class LoginController : Controller
    {
        DigitalBooksContext db = new DigitalBooksContext();
        private IConfiguration _config;
        public LoginController(IConfiguration config)
        {
            _config = config;
        }

        [HttpGet]
        public IActionResult Login()
        {
            Login login = new Login();
            return View(login);
        }

        [HttpPost]
        //[Route("Login/Login")]
        public IActionResult Login(Login login)
        {
            IActionResult response = Unauthorized();
            var user = AuthenticateUser(login, false);
            if (user != null)
            {
                var tokenString = GenerateToken(user);
                response = Ok(new { token = tokenString, userData = user });
            }
            return RedirectToAction("Create", "Author");
        }

        private Login AuthenticateUser(Login login, bool IsRegister)
        {
            if (IsRegister)
            {
                db.Logins.Add(login);
                db.SaveChanges();
                return login;
            }
            else
            {
                if (db.Logins.Any(x => x.UserName == login.UserName && x.Password == login.Password))
                {
                    return db.Logins.Where(x => x.UserName == login.UserName && x.Password == login.Password).FirstOrDefault();
                }
                else
                {
                    return null;
                }
            }

        }
        private string GenerateToken(Login login)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            var token = new JwtSecurityToken(_config["jwt:Issuer"],
                _config["jwt:Audience"],
                null,
                expires: DateTime.Now.AddMinutes(120),
                signingCredentials: credentials);
            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        [HttpGet]
        public IActionResult Register()
        {
            Login login = new Login();
            return View(login);
        }

        [HttpPost]
        //[Route("Login/Register")]
        public IActionResult Register(Login login)
        {
            IActionResult response = Unauthorized();
            var user = AuthenticateUser(login, true);
            if (user != null)
            {
                var tokenString = GenerateToken(user);
                response = Ok(new { token = tokenString});
            }
            return RedirectToAction("Index","Home");
        }
    }
}
