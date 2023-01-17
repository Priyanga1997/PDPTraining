using Microsoft.AspNetCore.Mvc;
using MVCApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MVCApplication.Controllers
{
    public class DepartmentController : Controller
    {
        private readonly EmployeeContext _db;

        public DepartmentController(EmployeeContext db)
        {
            _db = db;
        }

        [HttpGet]
        public IActionResult Index()
        {
            var departmentList = _db.Department.ToList();
            return View(departmentList);
        }

        [HttpGet]
        public IActionResult Create()
        {
            Department department = new Department();
            return View(department);
        }

        [HttpPost]
        public IActionResult Create(Department dept)
        {
            Department department = new Department {
            DepartmentName = dept.DepartmentName,
            DepartmentLocation = dept.DepartmentLocation};
            _db.Department.Add(department);
            _db.SaveChanges();
            return View(department);
        }
    }
}
