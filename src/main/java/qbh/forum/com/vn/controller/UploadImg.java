package qbh.forum.com.vn.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/UploadImg")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UploadImg extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nameImg = "";
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            // refines the fileName in case it is an absolute path
            fileName = new File(fileName).getName();
            part.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
            nameImg = fileName;
        }
        String parthImg = "images/blog/" + nameImg;

        byte[] imageData = Files.readAllBytes(Paths.get(this.getFolderUpload().getAbsolutePath() + File.separator + nameImg));

        String base64Image = javax.xml.bind.DatatypeConverter.printBase64Binary(imageData);

        HttpSession session = request.getSession();
        Map<String, String> map = new HashMap<>();
        map.put(parthImg, base64Image);
        session.setAttribute("img", map);
        response.sendRedirect("post.jsp");
    }

    /**
     * Extracts file name from HTTP header content-disposition
     */

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public File getFolderUpload() {
        String avatarPath = "images/blog";
        ServletContext context = getServletContext();
        String absolutePath = context.getRealPath(avatarPath);
        File folderUpload = new File(absolutePath);
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }
}
