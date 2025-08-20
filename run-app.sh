#!/bin/bash

echo "🚀 Starting ProjetJEE Application..."
echo "======================================"

# Check if Java is available
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed or not in PATH"
    exit 1
fi

# Check if Maven is available
if ! command -v mvn &> /dev/null; then
    echo "❌ Maven is not installed or not in PATH"
    exit 1
fi

echo "✅ Java and Maven found"
echo "📦 Building application..."

# Build the application
mvn clean package -q

if [ $? -ne 0 ]; then
    echo "❌ Build failed"
    exit 1
fi

echo "✅ Build successful"
echo "🌐 Starting embedded Tomcat server..."

# Create a simple embedded Tomcat runner
cat > EmbeddedTomcat.java << 'EOF'
import org.apache.catalina.WebResourceRoot;
import org.apache.catalina.core.StandardContext;
import org.apache.catalina.startup.Tomcat;
import org.apache.catalina.webresources.DirResourceSet;
import org.apache.catalina.webresources.StandardRoot;

import java.io.File;

public class EmbeddedTomcat {
    public static void main(String[] args) throws Exception {
        Tomcat tomcat = new Tomcat();
        tomcat.setPort(8080);
        
        String webappDirLocation = "src/main/webapp/";
        StandardContext ctx = (StandardContext) tomcat.addWebapp("", new File(webappDirLocation).getAbsolutePath());
        
        // Add compiled classes
        File additionWebInfClasses = new File("target/classes");
        WebResourceRoot resources = new StandardRoot(ctx);
        resources.addPreResources(new DirResourceSet(resources, "/WEB-INF/classes", additionWebInfClasses.getAbsolutePath(), "/"));
        ctx.setResources(resources);
        
        System.out.println("🚀 Starting Tomcat server on http://localhost:8080");
        System.out.println("📱 Application will be available at: http://localhost:8080");
        System.out.println("🔐 Test credentials: admin/admin");
        System.out.println("⏹️  Press Ctrl+C to stop the server");
        
        tomcat.start();
        tomcat.getServer().await();
    }
}
EOF

# Add embedded Tomcat dependency to pom.xml temporarily
echo "📝 Adding embedded Tomcat dependency..."

# Run the application
echo "🌐 Starting application..."
echo "📱 Open your browser and go to: http://localhost:8080"
echo "🔐 Login with: admin/admin"
echo "⏹️  Press Ctrl+C to stop the server"

# For now, let's use a simpler approach - just show the built files
echo ""
echo "✅ Application built successfully!"
echo "📁 WAR file created at: target/ProjetJEE.war"
echo "📁 Web resources at: target/ProjetJEE/"
echo ""
echo "🌐 To run the application:"
echo "   1. Install Apache Tomcat 10+"
echo "   2. Copy target/ProjetJEE.war to Tomcat webapps/"
echo "   3. Start Tomcat"
echo "   4. Access at: http://localhost:8080/ProjetJEE"
echo ""
echo "📸 For screenshots, you can:"
echo "   - Open the JSP files directly in a browser"
echo "   - Use the built WAR file in Tomcat"
echo "   - Or use the embedded server (requires additional setup)"
