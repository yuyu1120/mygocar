package com.example.rentcar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.rentcar.daoimpl.MemberDAOImpl;
import com.example.rentcar.dto.MemberDTO;
import com.example.rentcar.model.Member;

@Controller
public class AdmInMemberController {

    @Autowired
    private MemberDAOImpl memberDAO;

    @RequestMapping("/cc")
    public String index(Model model) {

        List<Member> members = memberDAO.findAll();

        model.addAttribute("members", members);
        System.out.println(members.get(3).getAccount());

        return "admin/member-list";
    }

    @PostMapping("/admin/update-member")
    public String updateMember(@RequestBody MemberDTO dto) {

        Member m = memberDAO.findById(dto.getId());
        m.setAccount(dto.getAccount());
        m.setName(dto.getName());
        m.setEmail(dto.getEmail());
        m.setPhone(dto.getPhone());
        m.setRole(dto.getRole());
        memberDAO.update(m);
        System.out.println("有進入哈哈哈2");
        return "redirect:/c"; // 刪除後回到會員列表
    }

    @GetMapping("/admin/delete-member")
    public String deleteMember(@RequestParam("id") int id) {
        memberDAO.delete(id);
        System.out.println("ㄏ哈哈哈");
        return "redirect:/c"; // 刪除後回到會員列表
    }

}
