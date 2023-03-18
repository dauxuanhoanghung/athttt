package com.athttt.controllers;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriUtils;

import com.athttt.entity.Product;
import com.athttt.request.InsertionProductRequest;
import com.athttt.service.CategoryService;
import com.athttt.service.ProductService;

@RestController
public class ProductController {

	@Autowired
	ProductService productService;

	@Autowired
	CategoryService categoryService;

	@PostMapping(value = "/add-product")
	public String addProduct(@RequestBody(required = false) String form) {
		if (form != null) {
			Map<String, String> formMap = this.splitResquestBody(form);
			System.out.println(formMap);
			Product newProduct = new Product();
			newProduct.setName(formMap.getOrDefault("name", null));
			newProduct.setCategoryId(categoryService.findById(Long.valueOf(formMap.getOrDefault("categoryID", null))));
			newProduct.setDescription(formMap.getOrDefault("description", null));
			newProduct.setThumbnail(formMap.getOrDefault("thumbnail", null));
			newProduct.setPrice(Float.valueOf(formMap.getOrDefault("price", null)));
			newProduct.setQuantity(Integer.valueOf(formMap.getOrDefault("quantity", null)));

			Product result = productService.save(newProduct);

			if (result != null) {
				return "success";
			}

			return "fail";
		}

		return "fail";
	}
	private Map<String, String> splitResquestBody(String res) {
		if (res != null) {
			res = UriUtils.decode(res, StandardCharsets.UTF_8).replace("+", " ");
			System.out.println(res);
			List<String> kav = Arrays.asList(res.split("&"));
			System.out.println(kav);
			Map<String, String> infos = new HashMap<>();
			kav.forEach(e -> {
				String[] kv = e.split("=");
				if (kv.length > 1)
					infos.put(kv[0], kv[1]);
				else
					infos.put(kv[0], "");
			});
			return infos;
		}
		return null;
	}
}
